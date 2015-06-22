#!/bin/bash

# Resolve redis host/port using environment, then link, then default value
REDIS_RESOLVED_HOST=${REDIS_EXT_HOST:-${REDIS_PORT_6379_TCP_ADDR:-"127.0.0.1"}}
REDIS_RESOLVED_PORT=${REDIS_EXT_PORT:-${REDIS_PORT_6379_TCP_PORT:-"6379"}}

# Replace the redis placeholders with the resolved values
find /etc/logstash/run.d/ -type f -exec sed -i "s/%REDIS_HOST%/$REDIS_RESOLVED_HOST/g" {} \;
find /etc/logstash/run.d/ -type f -exec sed -i "s/%REDIS_PORT%/$REDIS_RESOLVED_PORT/g" {} \;