FROM debian:bullseye-slim

LABEL MAINTAINER="patrick@kite4fun.nl"
ARG SIGNAL_CLI_VERSION='0.10.11'

RUN apt-get update && \
  apt-get install -y apt-utils libterm-readline-perl-perl &&  \
  apt-get install -y openjdk-17-jre curl locales && \
  apt-get clean

RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
  dpkg-reconfigure --frontend=noninteractive locales && \
  update-locale LANG=en_US.UTF-8

ENV LANG en_US.UTF-8
RUN curl -OL https://github.com/AsamK/signal-cli/releases/download/v$SIGNAL_CLI_VERSION/signal-cli-$SIGNAL_CLI_VERSION-Linux.tar.gz && \
  tar -zxvf signal-cli-$SIGNAL_CLI_VERSION-Linux.tar.gz && \
  rm -f signal-cli-$SIGNAL_CLI_VERSION-Linux.tar.gz && \
  ln -s signal-cli-$SIGNAL_CLI_VERSION signal

USER nobody
VOLUME /config
ENTRYPOINT ["/signal/bin/signal-cli", "--config", "/config"]
