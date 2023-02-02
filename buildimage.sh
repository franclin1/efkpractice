#!/bin/bash

# getting username
user=$(cat ./creds/dockeruser.txt)

# docker login
cat dockerpassword.txt | docker login --username $user --password-stdin

# build and push node-image
docker buildx build --platform=linux/amd64 -t node-app -f ./node-app/Dockerfile ./node-app/
docker tag node-app $user/demo-app:node-1.0
docker push $user/demo-app:node-1.0

# build and push java-image
cd java-app-efk
./gradlew build
docker buildx build --platform=linux/amd64 -t java-app -f Dockerfile .
docker tag java-app $user/demo-app:java-1.0
docker push $user/demo-app:java-1.0