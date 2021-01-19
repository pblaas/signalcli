FROM debian

label MAINTAINER="patrick@kite4fun.nl"
ARG SIGNAL_CLI_VERSION='0.7.4'

RUN apt-get update && \
  apt-get install -y libterm-readline-perl-perl openjdk-11-jre curl

#RUN apk update && \
#  apk add --no-cache openjdk11-jre curl

RUN curl -OL https://github.com/AsamK/signal-cli/releases/download/v$SIGNAL_CLI_VERSION/signal-cli-$SIGNAL_CLI_VERSION.tar.gz && \ 
  tar -zxvf signal-cli-$SIGNAL_CLI_VERSION.tar.gz && \
  rm -f signal-cli-$SIGNAL_CLI_VERSION.tar.gz && \
  ln -s signal-cli-$SIGNAL_CLI_VERSION signal 

USER nobody
VOLUME /config
ENTRYPOINT ["/signal/bin/signal-cli", "--config", "/config"]
