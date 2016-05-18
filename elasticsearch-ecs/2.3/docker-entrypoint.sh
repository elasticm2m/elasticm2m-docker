#!/bin/bash

set -e

# Add elasticsearch as command if needed
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch
# allow the container to be started with `--user`
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	# Change the ownership of /usr/share/elasticsearch/data to elasticsearch
	chown -R elasticsearch:elasticsearch /usr/share/elasticsearch/data

	set -- gosu elasticsearch "$@"
	#exec gosu elasticsearch "$BASH_SOURCE" "$@"
fi


# ECS will report the docker interface without help, so we override that with host's private ip
AWS_MAC=`curl -s http://169.254.169.254/latest/meta-data/mac`
AWS_SECURITY_GROUP_IDS=`curl -s http://169.254.169.254/latest/meta-data/network/interfaces/macs/${AWS_MAC}/security-group-ids | paste -s -d"," -`

export AWS_PRIVATE_IP=`curl -s http://169.254.169.254/latest/meta-data/local-ipv4`
set -- "$@" --network.publish_host=${AWS_PRIVATE_IP} --discovery.type=ec2 --discovery.ec2.groups="${AWS_SECURITY_GROUP_IDS}"

# As argument is not related to elasticsearch,
# then assume that user wants to run his own process,
# for example a `bash` shell to explore this image
exec "$@"