# docker commnd to run logspout

docker run -d --name="logspout" \
        --network="elk-network" \
        -e EXCLUDE_LABEL=logspout.exclude \
        -e 'RAW_FORMAT={ "container" : "{{ .Container.Name }}", "timestamp": "{{ .Time.Format "2006-01-02T15:04:05Z07:00" }}", "source" : "{{ .Source }}", "data": {{ .Data }} }' \
        --label="logspout.exclude=true" \
        --volume=/var/run/docker.sock:/var/run/docker.sock \
        --publish=127.0.0.1:9000:80 \
        gliderlabs/logspout udp://logstash:5000

# raw+udp://logstash:5000
# -e RAW_FORMAT="container {{ .Container.Name }}" \
# -e "RAW_FORMAT={{ toJSON .Data }}


# {
#   "Container": {
#     "Id": "a8e70f314469140b83a7c4eda8f84073d8ac0d69a706d5e944e6e790c451ac23",
#     "Created": "2021-09-14T06:46:14.855712Z",
#     "Path": "/docker-entrypoint.sh",
#     "Args": [
#       "kong",
#       "docker-start"
#     ],
#     "Config": {
#       "Hostname": "a8e70f314469",
#       "User": "kong",
#       "ExposedPorts": {
#         "8000/tcp": {},
#         "8001/tcp": {},
#         "8443/tcp": {},
#         "8444/tcp": {}
#       },
#       "StopSignal": "SIGQUIT",
#       "Env": [
#         "KONG_DATABASE=off",
#         "KONG_DECLARATIVE_CONFIG=/usr/local/kong/declarative/kong.yml",
#         "KONG_PROXY_ACCESS_LOG=/dev/stdout compression",
#         "KONG_ADMIN_ACCESS_LOG=/dev/stdout compression",
#         "KONG_PROXY_ERROR_LOG=/dev/stderr",
#         "KONG_ADMIN_ERROR_LOG=/dev/stderr",
#         "KONG_ADMIN_LISTEN=0.0.0.0:8001, 0.0.0.0:8444 ssl",
#         "PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
#         "ASSET=ce",
#         "KONG_VERSION=2.4.1",
#         "KONG_AMD64_SHA=582cbcf23eb4dcdf9873105ac7d8428a4022ec61bcc68642ad9dd8a5c03e2a57",
#         "KONG_ARM64_SHA=5ec35d1b19dd4e6592ad2c6586e68bfd1549c6a22840ce7d5654677b94e5028a"
#       ],
#       "Cmd": [
#         "kong",
#         "docker-start"
#       ],
#       "Image": "kaplan-kong:2.4",
#       "Entrypoint": [
#         "/docker-entrypoint.sh"
#       ],
#       "Labels": {
#         "com.docker.compose.config-hash": "8c54c20e9591ce08ae5e9de4ccf06af45428c75a799ffbc8cf6f83d2eada17ab",
#         "com.docker.compose.container-number": "1",
#         "com.docker.compose.oneoff": "False",
#         "com.docker.compose.project": "kong-gateway",
#         "com.docker.compose.project.config_files": "docker-compose.yml",
#         "com.docker.compose.project.working_dir": "/Users/kaplan/mine/kong-gateway",
#         "com.docker.compose.service": "kong",
#         "com.docker.compose.version": "1.29.2",
#         "maintainer": "Kong \u003csupport@konghq.com\u003e"
#       }
#     },
#     "State": {
#       "Status": "running",
#       "Running": true,
#       "Pid": 26854,
#       "StartedAt": "2021-09-14T06:46:15.3131594Z",
#       "FinishedAt": "0001-01-01T00:00:00Z"
#     },
#     "Image": "sha256:071953369fbe42c50d4f6b5231548803f65c7df3aa85050819fc787220404aad",
#     "NetworkSettings": {
#       "Networks": {
#         "kong-gateway_default": {
#           "MacAddress": "02:42:ac:1b:00:02",
#           "IPPrefixLen": 16,
#           "IPAddress": "172.27.0.2",
#           "Gateway": "172.27.0.1",
#           "EndpointID": "e9125c64a35092daa1de4a4cc5e5c76d22b874c15419125db28c90f9a70df6dd",
#           "NetworkID": "355e86a87659c8684a6c5cdba2abdba890f64d02a8974df2815f025346b160ca"
#         }
#       },
#       "Ports": {
#         "8000/tcp": [
#           {
#             "HostIP": "0.0.0.0",
#             "HostPort": "8000"
#           },
#           {
#             "HostIP": "::",
#             "HostPort": "8000"
#           }
#         ],
#         "8001/tcp": [
#           {
#             "HostIP": "127.0.0.1",
#             "HostPort": "8001"
#           }
#         ],
#         "8443/tcp": [
#           {
#             "HostIP": "0.0.0.0",
#             "HostPort": "8443"
#           },
#           {
#             "HostIP": "::",
#             "HostPort": "8443"
#           }
#         ],
#         "8444/tcp": [
#           {
#             "HostIP": "127.0.0.1",
#             "HostPort": "8444"
#           }
#         ]
#       },
#       "SandboxKey": "/var/run/docker/netns/12e303abbcf0"
#     },
#     "ResolvConfPath": "/var/lib/docker/containers/a8e70f314469140b83a7c4eda8f84073d8ac0d69a706d5e944e6e790c451ac23/resolv.conf",
#     "HostnamePath": "/var/lib/docker/containers/a8e70f314469140b83a7c4eda8f84073d8ac0d69a706d5e944e6e790c451ac23/hostname",
#     "HostsPath": "/var/lib/docker/containers/a8e70f314469140b83a7c4eda8f84073d8ac0d69a706d5e944e6e790c451ac23/hosts",
#     "LogPath": "/var/lib/docker/containers/a8e70f314469140b83a7c4eda8f84073d8ac0d69a706d5e944e6e790c451ac23/a8e70f314469140b83a7c4eda8f84073d8ac0d69a706d5e944e6e790c451ac23-json.log",
#     "Name": "/kong-gateway_kong_1",
#     "Driver": "overlay2",
#     "HostConfig": {
#       "PortBindings": {
#         "8000/tcp": [
#           {
#             "HostPort": "8000"
#           }
#         ],
#         "8001/tcp": [
#           {
#             "HostIP": "127.0.0.1",
#             "HostPort": "8001"
#           }
#         ],
#         "8443/tcp": [
#           {
#             "HostPort": "8443"
#           }
#         ],
#         "8444/tcp": [
#           {
#             "HostIP": "127.0.0.1",
#             "HostPort": "8444"
#           }
#         ]
#       },
#       "NetworkMode": "kong-gateway_default",
#       "IpcMode": "private",
#       "RestartPolicy": {},
#       "LogConfig": {
#         "Type": "json-file"
#       },
#       "ShmSize": 67108864
#     },
#     "GraphDriver": {
#       "Name": "overlay2",
#       "Data": {
#         "LowerDir": "/var/lib/docker/overlay2/c1c256b2ee43d8fafc4dc6ecfe848458bc28801ebfbc78973848e4505e0b1a51-init/diff:/var/lib/docker/overlay2/ge9e1q0ahrbqoxvrr4gnua8fj/diff:/var/lib/docker/overlay2/73w03b14vrwj8teq8wh2kf5qd/diff:/var/lib/docker/overlay2/684zdpf5hf97g507xnafrsivl/diff:/var/lib/docker/overlay2/d432f641d9d1db35ae7cdee89ce029e473bbfb736b1626707c84e6341c2a5cbf/diff:/var/lib/docker/overlay2/ae896fb0869fab5fe596d6933680f6680e50eb9e888502cdaaa290b3d47b8e30/diff:/var/lib/docker/overlay2/bcb796e58e5ee1510559899fa4af2d946a66946ead872975346fd531cd6e7bdd/diff:/var/lib/docker/overlay2/a8b79554b3db09730ea303b836766856511ac7ae2b23622f609985c384acb506/diff",
#         "MergedDir": "/var/lib/docker/overlay2/c1c256b2ee43d8fafc4dc6ecfe848458bc28801ebfbc78973848e4505e0b1a51/merged",
#         "UpperDir": "/var/lib/docker/overlay2/c1c256b2ee43d8fafc4dc6ecfe848458bc28801ebfbc78973848e4505e0b1a51/diff",
#         "WorkDir": "/var/lib/docker/overlay2/c1c256b2ee43d8fafc4dc6ecfe848458bc28801ebfbc78973848e4505e0b1a51/work"
#       }
#     }
#   },
#   "Source": "stdout",
#   "Data": "{\"time_local\":\"14/Sep/2021:11:18:10 +0000\",\"remote_addr\": \"172.27.0.1\",\"remote_user\":\"\",\"request\":\"GET /hello/elvis HTTP/1.1\",\"status\": 200,\"body_bytes_sent\":13,\"request_time\":0.017,\"http_referrer\":\"\",\"http_user_agent\":\"vscode-restclient\",\"http_x_forwarded_for\":\"\",\"host\":\"localhost\"}",
#   "Time": "2021-09-14T11:18:10.9813456Z"
# }