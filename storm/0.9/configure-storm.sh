#!/bin/bash

################################################
# CONFIGURE STORMLOCAL
################################################
STORM_LOCAL=${STORM_LOCAL:-"`hostname`"}
sed -i -e "s/%STORM_LOCAL%/$STORM_LOCAL/g" $STORM_HOME/conf/storm.yaml


################################################
# CONFIGURE CHILDOPTS
################################################
NIMBUS_CHILDOPTS=${NIMBUS_CHILDOPTS:-"-Xmx1024m"}
sed -i -e "s/%NIMBUS_CHILDOPTS%/$NIMBUS_CHILDOPTS/g" $STORM_HOME/conf/storm.yaml

DRPC_CHILDOPTS=${DRPC_CHILDOPTS:-"-Xmx768m"}
sed -i -e "s/%DRPC_CHILDOPTS%/$DRPC_CHILDOPTS/g" $STORM_HOME/conf/storm.yaml

SUPERVISOR_CHILDOPTS=${SUPERVISOR_CHILDOPTS:-"-Xmx256m"}
sed -i -e "s/%SUPERVISOR_CHILDOPTS%/$SUPERVISOR_CHILDOPTS/g" $STORM_HOME/conf/storm.yaml

WORKER_CHILDOPTS=${WORKER_CHILDOPTS:-"-Xmx256m"}
sed -i -e "s/%WORKER_CHILDOPTS%/$WORKER_CHILDOPTS/g" $STORM_HOME/conf/storm.yaml

UI_CHILDOPTS=${UI_CHILDOPTS:-"-Xmx768m"}
sed -i -e "s/%UI_CHILDOPTS%/$UI_CHILDOPTS/g" $STORM_HOME/conf/storm.yaml


################################################
# CONFIGURE ZOOKEEPER
################################################
ZOOKEEPER_RESOLVED_HOST=${ZOOKEEPER_EXT_HOST:-${ZOOKEEPER_PORT_2181_TCP_ADDR:-"UNAVAILABLE"}}
ZOOKEEPER_RESOLVED_PORT=${ZOOKEEPER_EXT_PORT:-${ZOOKEEPER_PORT_2181_TCP_PORT:-"2181"}}

sed -i -e "s/%ZOOKEEPER_HOST%/$ZOOKEEPER_RESOLVED_HOST/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%ZOOKEEPER_PORT%/$ZOOKEEPER_RESOLVED_PORT/g" $STORM_HOME/conf/storm.yaml


################################################
# CONFIGURE NIMBUS
################################################
NIMBUS_RESOLVED_HOST=${NIMBUS_EXT_HOST:-${NIMBUS_PORT_6627_TCP_ADDR:-"UNAVAILABLE"}}
NIMBUS_RESOLVED_PORT=${NIMBUS_EXT_PORT:-${NIMBUS_PORT_6627_TCP_PORT:-"6627"}}

sed -i -e "s/%NIMBUS_HOST%/$NIMBUS_RESOLVED_HOST/g" $STORM_HOME/conf/storm.yaml
sed -i -e "s/%NIMBUS_PORT%/$NIMBUS_RESOLVED_PORT/g" $STORM_HOME/conf/storm.yaml


################################################
# CONFIGURE SUPERVISOR
################################################
SUPERVISOR_NUM_SLOTS=${SUPERVISOR_NUM_SLOTS:-4}

# Make sure the number of slots is in range
if [ $SUPERVISOR_NUM_SLOTS -lt 1 ]
then
    echo "WARN: SUPERVISOR_NUM_SLOTS < 1... Using SUPERVISOR_NUM_SLOTS = 1"
    SUPERVISOR_NUM_SLOTS=1
fi

if [ $SUPERVISOR_NUM_SLOTS -gt 100 ]
then
    echo "WARN: SUPERVISOR_NUM_SLOTS > 100... Using SUPERVISOR_NUM_SLOTS = 100"
    SUPERVISOR_NUM_SLOTS=1
fi  

for SUPERVISOR_SLOT_PORT in $( seq -f "67%02g" 0 $(( $SUPERVISOR_NUM_SLOTS - 1 )) )
do
    SUPERVISOR_SLOTS="${SUPERVISOR_SLOTS}    - $SUPERVISOR_SLOT_PORT\n"
done

sed -i -e "s/%SUPERVISOR_SLOTS%/$SUPERVISOR_SLOTS/g" $STORM_HOME/conf/storm.yaml