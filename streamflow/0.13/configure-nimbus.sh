#!/bin/bash

# Resolve nimbus host/port using environment, then link, then default value
NIMBUS_RESOLVED_HOST=${NIMBUS_EXT_HOST:-${NIMBUS_PORT_6627_TCP_ADDR:-"UNAVAILABLE"}}
NIMBUS_RESOLVED_PORT=${NIMBUS_EXT_PORT:-${NIMBUS_PORT_6627_TCP_PORT:-"6627"}}

# Replace the nimbus placeholders with the resolved values
sed -i -e "s/%NIMBUS_HOST%/$NIMBUS_RESOLVED_HOST/g" $STREAMFLOW_HOME/conf/streamflow.yml
sed -i -e "s/%NIMBUS_PORT%/$NIMBUS_RESOLVED_PORT/g" $STREAMFLOW_HOME/conf/streamflow.yml