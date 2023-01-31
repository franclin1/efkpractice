#!/bin/bash

# docker login
cat dockerpassword.txt | docker login --username franclin1 --password-stdin

# build node-image
docker buildx build --platform=linux/amd64 -t node-app -f ./node-app/Dockerfile ./node-app/
docker tag node-app franclin1/demo-app:node-1.0
docker push franclin1/demo-app:node-1.0

# build java-image
cd java-app-efk
./gradlew build
docker buildx build --platform=linux/amd64 -t java-app -f Dockerfile .
docker tag java-app franclin1/demo-app:java-1.0
docker push franclin1/demo-app:java-1.0