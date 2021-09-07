package main

import (
	"github.com/Kong/go-pdk/server"
	reqlimit "github.com/elvisferns/kong-gateway/rate-limit/req-limit"
)

func main() {
	Version := "1.1"
	Priority := 1000
	_ = server.StartServer(reqlimit.New, Version, Priority)
}
