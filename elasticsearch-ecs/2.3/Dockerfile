FROM elasticsearch:2.3
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

WORKDIR /usr/share/elasticsearch
RUN bin/plugin install --batch cloud-aws
COPY docker-entrypoint.sh /docker-entrypoint.sh

#CMD /docker-entrypoint.sh --discovery.type=ec2 --discovery.ec2.groups=${AWS_SECURITY_GROUP}