#!/bin/bash

NIMBUS=${NIMBUS_HOST:-${NIMBUS_PORT_6627_TCP_ADDR:-"`hostname -i`"}}
sed -i -e "s/%NIMBUS_HOST%/$NIMBUS/g" $STORM_HOME/conf/storm.yaml