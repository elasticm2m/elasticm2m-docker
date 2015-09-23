#!/usr/bin/env bash

# Returns the most recent image id for a given repository
resolve_image_id() {
    local REPOSITORY=$1
    echo $(docker images | grep $REPOSITORY | head -n 1 | awk '{print $3}')
}

# Builds and pushes docker image with the associated tags
docker_build_and_push() {
    echo "Building repository: $REPOSITORY"

    docker build -t "$REPOSITORY:latest" --pull=true "$BUILD_DIR"
    local ID=$(resolve_image_id $REPOSITORY)

    for TAG in ${TAGS[@]}
    do
        echo "Pushing Tag: $REPOSITORY:$TAG"
        docker tag -f $ID $REPOSITORY:$TAG
        docker push $REPOSITORY:$TAG
    done
}

# Base Image
REPOSITORY="elasticm2m/base"
TAGS=("latest" "1.0" "1")
BUILD_DIR="base/1.0"
docker_build_and_push

# Java Image
REPOSITORY="elasticm2m/java"
TAGS=("latest" "8" "8u45")
BUILD_DIR="java/8"
docker_build_and_push

# Tomcat Image
REPOSITORY="elasticm2m/tomcat"
TAGS=("latest" "8.0" "8.0.26")
BUILD_DIR="tomcat/8.0"
docker_build_and_push

# Zookeeper Image
REPOSITORY="elasticm2m/zookeeper"
TAGS=("latest" "3.4" "3.4.6")
BUILD_DIR="zookeeper/3.4"
docker_build_and_push

# Storm Base Image
REPOSITORY="elasticm2m/storm"
TAGS=("latest" "0.9" "0.9.5")
BUILD_DIR="storm/0.9"
docker_build_and_push

# Storm Nimbus Image
REPOSITORY="elasticm2m/storm-nimbus"
TAGS=("latest" "0.9" "0.9.5")
BUILD_DIR="storm-nimbus/0.9"
docker_build_and_push

# Storm Supervisor Image
REPOSITORY="elasticm2m/storm-supervisor"
TAGS=("latest" "0.9" "0.9.5")
BUILD_DIR="storm-supervisor/0.9"
docker_build_and_push

# Storm UI Image
REPOSITORY="elasticm2m/storm-ui"
TAGS=("latest" "0.9" "0.9.5")
BUILD_DIR="storm-ui/0.9"
docker_build_and_push

# Logstash Image
REPOSITORY="elasticm2m/logstash"
TAGS=("latest" "1.5" "1.5.0")
BUILD_DIR="logstash/1.5"
docker_build_and_push

# Streamflow Image
REPOSITORY="elasticm2m/streamflow"
TAGS=("latest" "0.13" "0.13.0")
BUILD_DIR="streamflow/0.13"
docker_build_and_push
