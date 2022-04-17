#!/bin/bash

# Install web-show application for testing

## Create ConfigMap with ip context
#TARGET_IP=$(kubectl get pod -n kube-system -o wide| grep kube-controller | head -n 1 | awk '{print $6}')
TARGET_IP=8.8.8.8

kubectl create configmap web-show-context --from-literal=target.ip=${TARGET_IP}

## Deploy application and services
kubectl apply -f web-show-deployment.yaml

kubectl apply -f web-show-service.yaml

## Verify status
kubectl get deployments,pods,services


