FROM elasticm2m/base:1.0
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack Oracle Java 8 SDK
WORKDIR /opt
RUN wget --no-check-certificate \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    -qO- http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz | tar xvz -C /opt
RUN ln -s /opt/jdk1.8.0_45 /opt/java

ENV JAVA_HOME /opt/java
ENV PATH $JAVA_HOME/bin:$PATH