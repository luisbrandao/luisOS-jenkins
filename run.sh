#!/bin/bash
docker run --privileged -d --name luisos-jenkins -p 2222:22 -p 8080:8080 --restart unless-stopped -v jenkins_data:/var/lib/jenkins luisos-jenkins
