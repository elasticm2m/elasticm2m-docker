#!/bin/bash

# Start all runtime services (PostgreSQL, Nginx, and PHP-FPM)
service postgresql start
service php5-fpm start
service nginx start

echo "Nominatim Service Started...";

exec "$@";