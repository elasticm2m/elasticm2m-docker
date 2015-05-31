echo "Building elasticm2m/base"
docker build -t elasticm2m/base base

echo "Building elasticm2m/java"
docker build -t elasticm2m/java java

echo "Building elasticm2m/tomcat"
docker build -t elasticm2m/tomcat tomcat

echo "Building elasticm2m/zookeeper..."
docker build -t elasticm2m/zookeeper zookeeper

echo "Building elasticm2m/storm..."
docker build -t elasticm2m/storm storm

echo "Building elasticm2m/storm-nimbus..."
docker build -t elasticm2m/storm-nimbus storm-nimbus

echo "Building elasticm2m/storm-supervisor..."
docker build -t elasticm2m/storm-supervisor storm-supervisor

echo "Building elasticm2m/storm-ui..."
docker build -t elasticm2m/storm-ui storm-ui

echo "Building elasticm2m/logstash..."
docker build -t elasticm2m/logstash logstash

echo "Building elasticm2m/streamflow..."
docker build -t elasticm2m/streamflow streamflow
