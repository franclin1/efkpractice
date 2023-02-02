#!/bin/bash

## variables
namespace=$(cat ./creds/namespace.txt)
# restarting fluentd daemonset
kubectl rollout restart daemonset/fluentd -n $namespace
# restarting elasticsearch statefullset 
kubectl rollout restart statefulset/elasticsearch-master -n $namespace

http-get http://:http/fluentd.healthcheck%3Fjson=%257B%2522ping%2522%253A+%2522pong%2522%257D delay=5s timeout=5s period=10s #success=1 #failure=6
http-get http://:http/fluentd.healthcheck%3Fjson=%257B%2522ping%2522%253A+%2522pong%2522%257D delay=5s timeout=5s period=10s #success=1 #failure=6