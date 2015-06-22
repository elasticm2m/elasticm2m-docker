#!/bin/bash

# Resolve elasticsearch host/port using environment, then link, then default value
ELASTICSEARCH_RESOLVED_HOST=${ELASTICSEARCH_EXT_HOST:-${ELASTICSEARCH_PORT_9200_TCP_ADDR:-"UNAVAILABLE"}}
ELASTICSEARCH_RESOLVED_PORT=${ELASTICSEARCH_EXT_PORT:-${ELASTICSEARCH_PORT_9200_TCP_PORT:-"9200"}}

# Replace the elasticsearch placeholders with the resolved values
sed -i -e "s/%ELASTICSEARCH_HOST%/$ELASTICSEARCH_RESOLVED_HOST/g" $STREAMFLOW_HOME/conf/streamflow.yml
sed -i -e "s/%ELASTICSEARCH_PORT%/$ELASTICSEARCH_RESOLVED_PORT/g" $STREAMFLOW_HOME/conf/streamflow.yml