#!/bin/bash

# get namespace
namespace=$(cat ./creds/namespace.txt)
# delete pull-secret
kubectl delete secret/myregistrysecret -n $namespace

# deploying apps
kubectl delete -f ./node-app/deployment.yaml -n $namespace
kubectl delete -f ./java-app-efk/deployment.yaml -n $namespace