FROM elasticm2m/java:8
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack the Apache Zookeeper distribution
RUN wget -qO- http://www.us.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar xvz -C /opt
RUN ln -s /opt/zookeeper-3.4.6 /opt/zookeeper

COPY configure-autopurge.sh /usr/bin/configure-autopurge.sh
RUN mv /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg

WORKDIR /opt/zookeeper
ENV ZK_HOME /opt/zookeeper

ENV ZK_AUTOPURGE_INTERVAL 1

EXPOSE 2181 2888 3888

CMD /usr/bin/configure-autopurge.sh \
    && bin/zkServer.sh start-foreground