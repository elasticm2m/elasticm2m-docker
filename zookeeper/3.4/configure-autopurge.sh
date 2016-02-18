#!/bin/bash

sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZK_HOME/conf/log4j.properties
sed -i -r 's|\$ZK_AUTOPURGE_INTERVAL|'$ZK_AUTOPURGE_INTERVAL'|g' $ZK_HOME/conf/zoo.cfg