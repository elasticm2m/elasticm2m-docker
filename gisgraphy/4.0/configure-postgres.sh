#!/bin/bash

POSTGRES_RESOLVED_HOST=${POSTGRES_EXT_HOST:-${POSTGRES_PORT_5432_TCP_ADDR:-"UNAVAILABLE"}}
POSTGRES_RESOLVED_PORT=${POSTGRES_EXT_PORT:-${POSTGRES_PORT_5432_TCP_PORT:-"5432"}}

sed -i "/jdbc.url=/c\jdbc.url=jdbc:postgresql://${POSTGRES_RESOLVED_HOST}:${POSTGRES_RESOLVED_PORT}/gisgraphy" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties
sed -i "/hibernate.connection.url=/c\hibernate.connection.url=jdbc:postgresql://${POSTGRES_RESOLVED_HOST}:${POSTGRES_RESOLVED_PORT}/gisgraphy" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties


POSTGRES_USERNAME=${POSTGRES_USERNAME:-"gisgraphy"}

sed -i "/jdbc.username=/c\jdbc.username=${POSTGRES_USERNAME}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties
sed -i "/hibernate.connection.username=/c\hibernate.connection.username=${POSTGRES_USERNAME}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties


POSTGRES_PASSWORD=${POSTGRES_PASSWORD:-"gisgraphy1234"}

sed -i "/jdbc.password=/c\jdbc.password=${POSTGRES_PASSWORD}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties
sed -i "/hibernate.connection.password=/c\hibernate.connection.password=${POSTGRES_PASSWORD}" \
    /opt/gisgraphy/webapps/ROOT/WEB-INF/classes/jdbc.properties