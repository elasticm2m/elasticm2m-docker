#!/bin/bash

# Resolve elasticsearch host/port using environment, then link, then default value
ELASTICSEARCH_RESOLVED_HOST=${ELASTICSEARCH_EXT_HOST:-${ELASTICSEARCH_PORT_9200_TCP_ADDR:-"127.0.0.1"}}
ELASTICSEARCH_RESOLVED_PORT=${ELASTICSEARCH_EXT_PORT:-${ELASTICSEARCH_PORT_9200_TCP_PORT:-"9200"}}

# Replace the elasticsearch placeholders with the resolved values
find /etc/logstash/run.d/ -type f -exec sed -i "s/%ELASTICSEARCH_HOST%/$ELASTICSEARCH_RESOLVED_HOST/g" {} \;
find /etc/logstash/run.d/ -type f -exec sed -i "s/%ELASTICSEARCH_PORT%/$ELASTICSEARCH_RESOLVED_PORT/g" {} \;