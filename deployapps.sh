#!/bin/bash

# creating secret for registry 
password=$(cat ./creds/dockerpassword.txt)
user=$(cat ./creds/dockeruser.txt)
namespace=$(cat ./creds/namespace.txt)
kubectl create secret docker-registry myregistrysecret --docker-server=docker.io --docker-username=$user --docker-password=$password -n $namespace

# deploying apps
kubectl apply -f ./node-app/deployment.yaml -n $namespace
kubectl apply -f ./java-app-efk/deployment.yaml -n $namespace