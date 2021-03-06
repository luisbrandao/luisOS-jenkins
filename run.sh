#!/bin/bash
var=$(docker volume ls | grep jenkins_data)
if [ -z "$var" ] ; then
  docker volume create jenkins_data
else
  echo "Jenkins volume alerady exists"
fi

docker run --privileged -d \
  --name luisos-jenkins \
  --restart unless-stopped \
  -p 8080:8080 \
  -v jenkins_data:/var/lib/jenkins \
  -v /var/run/docker.sock:/var/run/docker.sock \
  registry.techsytes.com/luisos-jenkins:latest
