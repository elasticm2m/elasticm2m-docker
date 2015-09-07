#!/bin/bash

echo "Building elasticm2m/nominatim"
docker build -t elasticm2m/nominatim:latest --pull=true nominatim/2.4

echo "Publishing elasticm2m/nominatim"
docker push elasticm2m/nominatim:latest
