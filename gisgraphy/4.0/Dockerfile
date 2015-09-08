FROM elasticm2m/base:1.0
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Install updates to make Oracle Java libraries available
RUN apt-get -y install software-properties-common
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update

# Install Java 7 instead of Java 8 due to older Spring version dependencies
RUN echo debconf shared/accepted-oracle-license-v1-1 select true | debconf-set-selections
RUN apt-get install oracle-java7-installer -y

# Install Unzip
RUN apt-get -y install unzip

# Download and unpack the Gisgraphy distribution
RUN wget http://download.gisgraphy.com/releases/gisgraphy-4.0-beta1.zip -O /opt/gisgraphy-4.0-beta1.zip && \
    unzip /opt/gisgraphy-4.0-beta1.zip -d /opt/ && \
    rm /opt/gisgraphy-4.0-beta1.zip && \
    mv /opt/gisgraphy-4.0-beta1 /opt/gisgraphy

# Make each gisgraphy script executable
RUN chmod +x /opt/gisgraphy/*.sh

ENV GISGRAPHY_HOME /opt/gisgraphy
WORKDIR $GISGRAPHY_HOME

COPY configure-postgres.sh /usr/bin/configure-postgres.sh
COPY configure-solr.sh /usr/bin/configure-solr.sh

EXPOSE 8080

COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/opt/gisgraphy/launch.sh"]