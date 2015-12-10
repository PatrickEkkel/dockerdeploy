#!/bin/bash
# start docker container
JENKINS_HOME=$2
BRANCH_TO_BUILD=$3
DOCKER_IMAGE=$1
PORT=$4
#CONTAINER_ID=$(docker run -d -v /top_build/ $2 -p 8090:9001 -e JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 -ti $1  bash)
CONTAINER_ID=$(docker run -d -p $PORT:8090 -i -t -e JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 -v $2:/top_build/ $DOCKER_IMAGE bash)
echo "started container with ID" $CONTAINER_ID
# run commands to get the container ready for usage

docker exec $CONTAINER_ID /root/docker_startup_services.sh
docker exec $CONTAINER_ID /root/build_and_deploy.sh $BRANCH_TO_BUILD
#docker stop $CONTAINER_ID
 
