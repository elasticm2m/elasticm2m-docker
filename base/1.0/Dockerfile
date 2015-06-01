FROM ubuntu:trusty
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

# Install the core dependencies
RUN apt-get update && apt-get install -y supervisor wget

RUN mkdir -p /var/log/supervisor

# Default supervisor configuration
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Default supervisor startup command
CMD ["/usr/bin/supervisord"]