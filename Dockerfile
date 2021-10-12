FROM kong:2.4-alpine

USER root

# copy route yml
COPY ./kong.yml /usr/local/kong/declarative/kong.yml

# copy kong config
COPY ./kong.conf /etc/kong/kong.conf

# copy kong status config
COPY ./kong-status.conf /etc/kong/kong-status.conf

# copy rate timit plugin
COPY ./rate-limit/rate-limit /usr/local/bin/rate-limit