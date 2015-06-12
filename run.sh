#!/bin/bash

function shutdown {
    echo "Shutting down RabbitMQ"
    rabbitmqctl stop
    exit 0
}

trap shutdown SIGINT EXIT HUP INT QUIT ABRT KILL ALRM TERM TSTP

rabbitmq-server
