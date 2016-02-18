FROM elasticm2m/java:8
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack the Apache Storm distribution
RUN wget -qO- http://www.us.apache.org/dist/storm/apache-storm-0.9.5/apache-storm-0.9.5.tar.gz | tar xvz -C /opt
RUN ln -s /opt/apache-storm-0.9.5 /opt/storm

WORKDIR /opt/storm
ENV STORM_HOME /opt/storm

VOLUME ["/var/log/storm", "/opt/storm/storm-local"]

COPY storm.yaml $STORM_HOME/conf/storm.yaml
COPY cluster.xml $STORM_HOME/logback/cluster.xml
COPY configure-storm.sh /usr/bin/configure-storm.sh