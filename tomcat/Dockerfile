FROM elasticm2m/java
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack Tomcat
WORKDIR /opt
RUN wget http://www.us.apache.org/dist/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz
RUN tar -xvzf apache-tomcat-8.0.22.tar.gz
RUN rm apache-tomcat-8.0.22.tar.gz

# Update Environment
ENV CATALINA_HOME /opt/apache-tomcat-8.0.22

EXPOSE 8080

CMD $CATALINA_HOME/bin/catalina.sh run
