FROM ubuntu
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Install the core dependencies
RUN apt-get -y install wget
RUN apt-get update && apt-get -y upgrade

# Download and unpack Oracle Java 8 SDK
WORKDIR /opt
RUN wget --no-check-certificate -c \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz && \
    tar -xvzf jdk-8u45-linux-x64.tar.gz && \
    rm jdk-8u45-linux-x64.tar.gz

ENV JAVA_HOME /opt/jdk1.8.0_45
ENV PATH $JAVA_HOME/bin:$PATH

