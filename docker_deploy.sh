#!/bin/bash

#deploy de buildslave container naar de lokale registry 
docker tag -f buildslave localhost:5000/buildslave
docker push localhost:5000/buildslave