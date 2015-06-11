FROM ubuntu:14.04
MAINTAINER Carlos Killpack <carlos@zulumarketing.com>

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_US.UTF-8
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

ADD http://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb /tmp/erlang-solutions-repo.deb
ADD https://github.com/rabbitmq/rabbitmq-server/releases/download/rabbitmq_v3_5_3/rabbitmq-server_3.5.3-1_all.deb /tmp/rabbitmq-server.deb

RUN apt-get update > /dev/null \
    && apt-get upgrade -y > /dev/null \
    && apt-get clean > /dev/null \
    && apt-get update > /dev/null \
    && dpkg -i /tmp/erlang-solutions-repo.deb 2> /dev/null \
    && apt-get update > /dev/null \
    && apt-get install -y supervisor erlang-base erlang-nox > /dev/null \
    && dpkg -i /tmp/rabbitmq-server.deb 2> /dev/null \
    && apt-get clean > /dev/null

USER root
EXPOSE 5672
ENTRYPOINT ["/usr/bin/supervisord"]
CMD ["-c", "/etc/supervisor/supervisor.conf"]
