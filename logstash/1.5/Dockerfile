FROM elasticm2m/java:8
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack the Logstash distribution
RUN wget -qO- http://download.elastic.co/logstash/logstash/logstash-1.5.0.tar.gz | tar xvz -C /opt
RUN ln -s /opt/logstash-1.5.0 /opt/logstash

COPY configure-logstash.sh /usr/bin/configure-logstash.sh
COPY configure-elasticsearch.sh /usr/bin/configure-elasticsearch.sh
COPY configure-redis.sh /usr/bin/configure-redis.sh

WORKDIR /opt/logstash
ENV LOGSTASH_HOME /opt/logstash

# Scripts will copy all config files from /etc/logstash/conf.d to /etc/logstash/run.d and inject variables
CMD /usr/bin/configure-logstash.sh \
    && /usr/bin/configure-elasticsearch.sh \
    && /usr/bin/configure-redis.sh \ 
    && /opt/logstash/bin/logstash agent -f /etc/logstash/run.d 