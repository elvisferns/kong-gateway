# docker commnd to run logspout

docker run -d --name="logspout" \
        --network="elk-network" \
        -e EXCLUDE_LABEL=logspout.exclude \
        --label="logspout.exclude=true" \
        --volume=/var/run/docker.sock:/var/run/docker.sock \
        --publish=127.0.0.1:9000:80 \
        gliderlabs/logspout udp://logstash:5000


# raw+udp://logstash:5000
# -e RAW_FORMAT="container {{ .Container.Name }}" \