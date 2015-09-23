FROM elasticm2m/base:1.0
MAINTAINER ElasticM2M <elasticm2m@gmail.com>

RUN apt-get update

# Install Basic Components
RUN apt-get -y install wget

# Install libgeos++
RUN apt-get -y install build-essential
RUN apt-get -y install gcc git osmosis
RUN apt-get -y install libxml2-dev libexpat1-dev libgeos-dev libpq-dev libbz2-dev libtool automake libproj-dev
RUN apt-get -y install proj-bin libgeos-c1 libgeos++-dev

# Install Boost (required by osm2pqsql)
RUN apt-get -y install autoconf make g++ libboost-dev \
  libboost-system-dev libboost-filesystem-dev libboost-thread-dev

# Install PHP5
RUN apt-get -y install php5 php-pear php5-pgsql php5-json php-db

# Install Postgres and PostGIS
RUN apt-get -y install postgresql postgis postgresql-contrib postgresql-9.3-postgis-2.1 postgresql-server-dev-9.3

# Install Protobuf
RUN apt-get -y install libprotobuf-c0-dev protobuf-c-compiler

# Install Nginx and dependencies
RUN apt-get -y install nginx php5-fpm

# Install Tiger Dependencies
RUN apt-get -y install python-gdal

# Pear DB commands
RUN pear install DB

# Build Nominatim from github source
RUN useradd -m -p password1234 nominatim
RUN mkdir -p /app/nominatim
RUN git clone --recursive https://github.com/twain47/Nominatim.git /app/nominatim
RUN cd /app/nominatim
WORKDIR /app/nominatim
RUN ./autogen.sh
RUN ./configure
RUN make

COPY local.php /app/nominatim/settings/local.php
RUN chown -R nominatim:nominatim /app/nominatim
ENV NOMINATIM_HOME /app/nominatim

# Configure postgresql
RUN service postgresql start && \
    pg_dropcluster --stop 9.3 main
RUN service postgresql start && \
    pg_createcluster --start -d /app/postgres/data -e UTF-8 9.3 main

RUN service postgresql start && \
    sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='nominatim'" | grep -q 1 || sudo -u postgres createuser -s nominatim && \
    sudo -u postgres psql postgres -tAc "SELECT 1 FROM pg_roles WHERE rolname='www-data'" | grep -q 1 || sudo -u postgres createuser -SDR www-data && \
    sudo -u postgres psql postgres -c "DROP DATABASE IF EXISTS nominatim"

# Initial osm data to load in the database
RUN mkdir -p /app/data/
RUN wget --output-document=/app/data/data.pbf http://download.geofabrik.de/north-america-latest.osm.pbf

# Initialize the nominatim database and load the provided data
RUN service postgresql start && \
    sudo -u nominatim ./utils/setup.php --osm-file /app/data/data.pbf --all --threads 2

# Initialize the nominatim website
RUN mkdir -p /var/www/nominatim
RUN ./utils/setup.php --create-website /var/www/nominatim
RUN chmod -R 755 /var/www/nominatim
RUN chown -R www-data:www-data /var/www/nominatim

# Adjust PostgreSQL configuration so that remote connections to the database are possible with trust authentication
RUN echo "host all  all    0.0.0.0/0  trust" >> /etc/postgresql/9.3/main/pg_hba.conf
RUN echo "listen_addresses='*'" >> /etc/postgresql/9.3/main/postgresql.conf

# Expose the PostgreSQL port
EXPOSE 5432

# Configure the nginx server to serve nominatim website files
COPY default /etc/nginx/sites-available/default

# Update php5-fpm configuration to use values required by nominatim
RUN sed -i "/listen.owner =/c\listen.owner = www-data" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "/listen.group =/c\listen.group = www-data" /etc/php5/fpm/pool.d/www.conf
RUN sed -i "/listen.mode =/c\listen.mode = 0666" /etc/php5/fpm/pool.d/www.conf

# Expose the nginx web port
EXPOSE 80

# Update the build with environment specific configuration files
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["tail", "-f", "/var/log/nginx/access.log"]