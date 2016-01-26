#!/bin/bash

sed -i -r 's|#(log4j.appender.ROLLINGFILE.MaxBackupIndex.*)|\1|g' $ZK_HOME/conf/log4j.properties
sed -i -r 's|#autopurge.purgeInterval=1|autopurge.purgeInterval='"$ZK_AUTOPURGE_INTERVAL"'|g' $ZK_HOME/conf/zoo.cfg