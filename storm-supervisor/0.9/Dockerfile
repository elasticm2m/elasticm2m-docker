FROM elasticm2m/storm:0.9
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

COPY storm-supervisor.conf /etc/supervisor/conf.d/storm-supervisor.conf

CMD /usr/bin/configure-zookeeper.sh \
    && /usr/bin/configure-nimbus.sh \
    && /usr/bin/supervisord