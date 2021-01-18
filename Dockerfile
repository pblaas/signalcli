FROM alpine:latest
label MAINTAINER="patrick@kite4fun.nl"
ARG SIGNAL_CLI_VERSION='0.6.12'

RUN apk update && \
  apk add openjdk11 curl

RUN curl -OL https://github.com/AsamK/signal-cli/releases/download/v$SIGNAL_CLI_VERSION/signal-cli-$SIGNAL_CLI_VERSION.tar.gz && \ 
  tar -zxvf signal-cli-$SIGNAL_CLI_VERSION.tar.gz && \
  rm -f signal-cli-$SIGNAL_CLI_VERSION.tar.gz && \
  ln -s signal-cli-$SIGNAL_CLI_VERSION signal 

USER nobody
VOLUME /config
ENTRYPOINT ["/signal/bin/signal-cli", "--config", "/config"]
