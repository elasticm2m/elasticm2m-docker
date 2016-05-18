#!/usr/bin/env bash

# Returns the most recent image id for a given repository
resolve_image_id() {
    local repository=$1
    echo $(docker images | grep $repository | head -n 1 | awk '{print $3}')
}

# Builds and pushes docker image with the associated tags
docker_build_and_push() {
    local repository=$1
    local build_dir=$2
    local tags=${@:3}

    echo "Building repository: $repository"

    docker build -t "$repository:latest" --pull=true "$build_dir"
    local id=$(resolve_image_id $repository)

    for tag in ${tags[@]}
    do
        echo "Pushing Tag: $repository:$tag"
        docker tag -f $id $repository:$tag
        docker push $repository:$tag
    done
}

# Build and push all docker images and their associated tags
docker_build_and_push "elasticm2m/base" "base/1.0" "1" "1.0"
docker_build_and_push "elasticm2m/java" "java/8" "8" "8u60"
docker_build_and_push "elasticm2m/tomcat" "tomcat/8.0" "8.0" "8.0.26"
docker_build_and_push "elasticm2m/zookeeper" "zookeeper/3.4" "3.4" "3.4.6"
docker_build_and_push "elasticm2m/storm" "storm/0.9" "0.9" "0.9.5"
docker_build_and_push "elasticm2m/storm-nimbus" "storm-nimbus/0.9" "0.9" "0.9.5"
docker_build_and_push "elasticm2m/storm-supervisor" "storm-supervisor/0.9" "0.9" "0.9.5"
docker_build_and_push "elasticm2m/storm-ui" "storm-ui/0.9" "0.9" "0.9.5"
docker_build_and_push "elasticm2m/logstash" "logstash/1.5" "1.5" "1.5.0"
docker_build_and_push "elasticm2m/streamflow" "streamflow/0.13" "0.13" "0.13.0"
docker_build_and_push "elasticm2m/elasticsearch-ecs" "elasticsearch-ecs/2.3" "2.3" "2.3.2"