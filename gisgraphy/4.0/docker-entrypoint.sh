#!/bin/bash

# Configure Postgres and SOLR
/usr/bin/configure-postgres.sh
/usr/bin/configure-solr.sh

exec "$@";