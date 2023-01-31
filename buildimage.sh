#!/bin/bash

# docker login
cat dockerpassword.txt | docker login --username franclin1 --password-stdin

# build node-image
docker build -t node-app -f ./node-app/Dockerfile ./node-app/
docker tag node-app franclin1/demo-app:node-1.0
docker push franclin1/demo-app:node-1.0

# build java-image
cd java-app-efk
./gradlew build
docker build -t java-app -f Dockerfile .
docker tag java-app franclin1/demo-app:java-1.0
docker push franclin1/demo-app:java-1.0
cd..

# creating secret for registry 
password=$(cat dockerpassword.txt)
passworddocker=$password
kubectl create secret docker-registry myregistrysecret --docker-server=docker.io --docker-username=franclin1 --docker-password=dockerpassword -n malteahlers