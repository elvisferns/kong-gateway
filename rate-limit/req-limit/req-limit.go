package ratelimit

import (
	"fmt"
	"time"

	"github.com/Kong/go-pdk"
)

type Config struct {
	LimitTime    int
	LimitRequest int
}

func New() interface{} {
	return &Config{}
}

type reqLimit struct {
	requests []time.Time
	left     int
}

var requests = make(map[string]*reqLimit)

func (config Config) Access(kong *pdk.PDK) {
	host, _ := kong.Request.GetHost()
	cachedRequest, exists := requests[host]

	if exists && len(cachedRequest.requests) > 0 {
		requestArr := cachedRequest.requests
		kong.Response.SetHeader("x-req-duration", fmt.Sprintf("%d count", time.Since(requestArr[0])/time.Second))
		kong.Response.SetHeader("x-req-count", fmt.Sprintf("%d count", cachedRequest.left-1))
		if cachedRequest.left > 0 {
			requests[host] = &reqLimit{
				requests: append(requestArr, time.Now()),
				left:     cachedRequest.left - 1,
			}

			return
		}

		if time.Since(requestArr[0]) > time.Duration(config.LimitTime)*time.Second {
			requestArr := requestArr[1:]
			cachedRequest.requests = append(requestArr, time.Now())
			return
		}

		kong.Response.Exit(429, "Maximum Requests Reached", make(map[string][]string))
	} else {
		requestLimit := make([]time.Time, config.LimitRequest)
		requestLimit[0] = time.Now()
		requests[host] = &reqLimit{
			requests: requestLimit,
			left:     config.LimitRequest - 1,
		}
	}
}
