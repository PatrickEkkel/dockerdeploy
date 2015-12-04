#!/bin/bash
DOCKER_ID=$1
docker run -d -e JAVA_HOME=JAVA_HOME=/usr/lib/jvm/java-7-openjdk-amd64 -ti $1 bash