FROM elasticm2m/java:8
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack Tomcat
RUN wget -qO- http://www.us.apache.org/dist/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz | tar xvz -C /opt \
	&& rm -rf /opt/apache-tomcat-8.0.22/webapps/*
RUN ln -s /opt/apache-tomcat-8.0.22 /opt/tomcat

WORKDIR /opt/tomcat

ENV CATALINA_HOME /opt/tomcat
ENV TOMCAT_HOME $CATALINA_HOME

EXPOSE 8080

COPY tomcat.conf /etc/supervisor/conf.d/tomcat.conf