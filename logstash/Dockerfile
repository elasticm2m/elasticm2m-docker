FROM elasticm2m/java:latest
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack the Logstash distribution
RUN wget -qO- http://download.elastic.co/logstash/logstash/logstash-1.5.0.tar.gz | tar xvz -C /opt
RUN ln -s /opt/logstash-1.5.0 /opt/logstash

# Fix jruby issue with Oracle Java SDK
RUN ln -s /lib/x86_64-linux-gnu/libcrypt.so.1 /usr/lib/x86_64-linux-gnu/libcrypt.so

VOLUME ["/etc/logstash/conf.d"]

WORKDIR /opt/logstash
ENV LOGSTASH_HOME /opt/logstash
EXPOSE 9292

CMD ["/opt/logstash/bin/logstash", "agent", "-f", "/etc/logstash/conf.d"]
