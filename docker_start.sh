#!/bin/bash
# start docker container
JENKINS_HOME=$2
CONTAINER_ID=$(docker run -d -v /top_build:$2 -p 8090:9001 -e JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 -ti $1  bash)
echo "started container with ID" $CONTAINER_ID
# run commands to get the container ready for usage
docker exec $CONTAINER_ID /root/docker_startup_services.sh
docker exec $CONTAINER_ID /root/build_and_deploy.sh
#docker stop $CONTAINER_ID
 
