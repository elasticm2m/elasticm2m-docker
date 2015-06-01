FROM elasticm2m/java:8
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Download and unpack the Streamflow distribution
RUN wget -qO- https://github.com/lmco/streamflow/releases/download/0.12.0/streamflow-0.12.0.tar.gz | tar xvz -C /opt
RUN ln -s /opt/streamflow-0.12.0 /opt/streamflow

COPY streamflow.conf /etc/supervisor/conf.d/streamflow.conf
COPY configure-nimbus.sh /usr/bin/configure-nimbus.sh
COPY configure-logstash.sh /usr/bin/configure-logstash.sh
COPY streamflow.yml /opt/streamflow/conf/streamflow.yml

WORKDIR /opt/streamflow
ENV STREAMFLOW_HOME /opt/streamflow

VOLUME ["/opt/streamflow/data"]

EXPOSE 8080

CMD /usr/bin/configure-nimbus.sh \
    && /usr/bin/configure-logstash.sh \
    && /usr/bin/supervisord
