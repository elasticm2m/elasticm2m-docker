FROM elasticm2m/java:8
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack the Apache Zookeeper distribution
RUN wget -qO- http://www.us.apache.org/dist/zookeeper/zookeeper-3.4.6/zookeeper-3.4.6.tar.gz | tar xvz -C /opt
RUN ln -s /opt/zookeeper-3.4.6 /opt/zookeeper

COPY configure-autopurge.sh /usr/bin/configure-autopurge.sh
COPY zoo.cfg /opt/zookeeper/conf/zoo.cfg

RUN mkdir /var/lib/zookeeper

WORKDIR /opt/zookeeper
ENV ZK_HOME /opt/zookeeper

# Disable autopurge by default
ENV ZK_AUTOPURGE_INTERVAL 0

# Schedule the Zookeeper purge as a cron job
#RUN echo "0 * * * * root cd $ZK_HOME && java -cp zookeeper-3.4.6.jar:lib/slf4j-api-1.6.1.jar:lib/slf4j-log4j12-1.6.1.jar:lib/log4j-1.2.16.jar:conf org.apache.zookeeper.server.PurgeTxnLog /var/zookeeper /var/zookeeper -n 3" > /etc/cron.d/zookeeper

EXPOSE 2181 2888 3888

CMD /usr/bin/configure-autopurge.sh \
    && bin/zkServer.sh start-foreground