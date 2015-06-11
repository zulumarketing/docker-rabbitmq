FROM ubuntu:14.04
MAINTAINER Carlos Killpack <carlos@zulumarketing.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

RUN apt-get update > /dev/null \
    && apt-get upgrade -y > /dev/null \
    && apt-get clean > /dev/null \
    && apt-get update > /dev/null \
    && apt-get install -y supervisor rabbitmq > /dev/null \
    && apt-get clean > /dev/null

USER root
EXPOSE 5432
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/supervisor.conf"]
