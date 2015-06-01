echo "Building elasticm2m/base"
docker build -t elasticm2m/base:1.0 base/1.0

echo "Building elasticm2m/java"
docker build -t elasticm2m/java:8 java/8

echo "Building elasticm2m/tomcat"
docker build -t elasticm2m/tomcat:8.0 tomcat/8.0

echo "Building elasticm2m/zookeeper..."
docker build -t elasticm2m/zookeeper:3.4 zookeeper/3.4

echo "Building elasticm2m/storm..."
docker build -t elasticm2m/storm:0.9 storm/0.9

echo "Building elasticm2m/storm-nimbus..."
docker build -t elasticm2m/storm-nimbus:0.9 storm-nimbus/0.9

echo "Building elasticm2m/storm-supervisor..."
docker build -t elasticm2m/storm-supervisor:0.9 storm-supervisor/0.9

echo "Building elasticm2m/storm-ui..."
docker build -t elasticm2m/storm-ui:0.9 storm-ui/0.9

echo "Building elasticm2m/logstash..."
docker build -t elasticm2m/logstash:1.5 logstash/1.5

echo "Building elasticm2m/streamflow..."
docker build -t elasticm2m/streamflow:0.12 streamflow/0.12
