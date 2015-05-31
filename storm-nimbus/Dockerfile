FROM elasticm2m/storm:latest
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

COPY storm-nimbus.conf /etc/supervisor/conf.d/storm-nimbus.conf
#COPY storm-drpc.conf /etc/supervisor/conf.d/storm-drpc.conf

EXPOSE 6627 3772 3773

CMD /usr/bin/configure-zookeeper.sh \
    && /usr/bin/configure-nimbus.sh \ 
    && /usr/bin/configure-stormlocal.sh \
    && /usr/bin/supervisord