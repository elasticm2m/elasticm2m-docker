#!/bin/bash

# Copy scripts from the build to the runtime directory
if [ -d "/etc/logstash/conf.d" ] ; then
    cp -rf /etc/logstash/conf.d /etc/logstash/run.d
else
    mkdir -p /etc/logstash/run.d
    cp /etc/logstash/conf.d /etc/logstash/run.d/logstash.conf
fi