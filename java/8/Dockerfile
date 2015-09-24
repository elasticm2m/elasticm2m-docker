FROM elasticm2m/base:1.0
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack Oracle Java 8 SDK
WORKDIR /opt
RUN wget --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -qO- http://download.oracle.com/otn-pub/java/jdk/8u60-b27/jdk-8u60-linux-x64.tar.gz | tar xvz -C /opt
RUN ln -s /opt/jdk1.8.0_60 /opt/java
RUN sed -i.bak 's/#networkaddress.cache.ttl=-1/networkaddress.cache.ttl=60/' /opt/java/jre/lib/security/java.security

ENV JAVA_HOME /opt/java
ENV PATH $JAVA_HOME/bin:$PATH
