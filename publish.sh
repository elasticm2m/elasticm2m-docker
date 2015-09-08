#!/bin/bash

echo "Building elasticm2m/gisgraphy"
docker build -t elasticm2m/gisgraphy:latest --pull=true gisgraphy/4.0

echo "Publishing elasticm2m/gisgraphy"
docker push elasticm2m/gisgraphy:latest
