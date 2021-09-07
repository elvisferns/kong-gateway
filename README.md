# Kong Setup using docker compose

``docker-compose.yml`` to run kong in a docker environment.

## Steps to run

* run command ``docker-compose up``

Kong proxy server will listen on port 8000 and the admin on 8001. Refer to [kong.yml](./kong.yml) for different path endpoints

## [rate-limit](./rate-limit) plugin

basic rate limit plugin written in go

uncomment the lines in [kong.yml](./kong.yml) and [docker-compose](./docker-compose.yml) to enable the plugin

### build plugin

* install go ver 1.14

* run command ``GOOS=linux GOARCH=amd64 go build .`` in the folder rate-limit (GOOS and GOARCH is not needed if building the executable in linux)

## Local [web-server](./web-server)

Basic web server written in Restify to test upstream server in kong

### Steps to run web server

* install Node

* cd into the web-server folder

* ``npm install`` to install npm packages

* ``npm start`` in another terminal to start the web-server
