#!/bin/bash

chown -R rabbitmq:rabbitmq /var/lib/rabbitmq
exec /usr/sbin/rabbitmq-server "$@"
