FROM elasticm2m/java
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack Tomcat
WORKDIR /opt
RUN wget http://www.us.apache.org/dist/tomcat/tomcat-8/v8.0.22/bin/apache-tomcat-8.0.22.tar.gz \
    && tar -xvzf apache-tomcat-8.0.22.tar.gz \
	&& rm apache-tomcat-8.0.22.tar.gz
RUN ln -s apache-tomcat-8.0.22 tomcat

# Remove the default tomcat webapps
RUN rm -rf tomcat/*

# Update Environment
ENV CATALINA_HOME /opt/tomcat
EXPOSE 8080

CMD ["tomcat/bin/catalina.sh", "run"]
