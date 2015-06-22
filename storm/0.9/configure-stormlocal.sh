#!/bin/bash

STORM_LOCAL=`hostname -i`
sed -i -e "s/%STORM_LOCAL%/$STORM_LOCAL/g" $STORM_HOME/conf/storm.yaml