FROM centos:7
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Install yum dependencies
RUN yum install -y wget
RUN yum install -y tar

# Download and unpack Oracle Java 8 SDK
RUN cd /opt && wget --no-check-certificate -c \
    --header "Cookie: oraclelicense=accept-securebackup-cookie" \
    http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz
RUN cd /opt && tar -xvzf jdk-8u45-linux-x64.tar.gz
RUN cd /opt && rm jdk-8u45-linux-x64.tar.gz

ENV JAVA_HOME /opt/jdk1.8.0_45
ENV PATH $JAVA_HOME/bin:$PATH

CMD ["/bin/bash"]

