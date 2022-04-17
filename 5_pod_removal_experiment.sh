#!/bin/bash

# Pod removal experiment
# The common experiment of periodic and random Pod removal

## Install nginx application
### Setup namespace for nginx
kubectl create namespace chaos-sandbox

kubectl apply -f nginx.yaml -n chaos-sandbox

kubectl get -n chaos-sandbox deployments,pods,services

## Define experiment
### List all nginx pods labelled for chaos experiment
kubectl get -n chaos-sandbox deployments,pods,services -l chaos=blast-here

### Apply experiment
kubectl apply -f pod-removal-experiment.yaml

kubectl get Schedule -n chaos-mesh

### Watch pods
watch kubectl get -n chaos-sandbox deployments,pods,services


