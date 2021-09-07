FROM kong:2.4

# USER root

# copy route yml
COPY ./kong.yml /usr/local/kong/declarative/kong.yml

# copy kong config
COPY ./kong.conf /etc/kong/kong.conf

# copy rate timit plugin
COPY ./rate-limit/rate-limit /usr/local/bin/rate-limit