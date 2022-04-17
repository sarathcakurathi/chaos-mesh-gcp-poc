#!/bin/bash

# Scheduled experiment
# This experiment will inject network chaos periodically: 
#    10ms network delay should be injected every minute that lasts for 30 seconds

## Apply scheduled network delay experiment
kubectl apply -f scheduled-network-delay-experiment.yaml

kubectl get Schedule

## Update experiment and apply
kubectl apply -f scheduled-network-delay-experiment.yaml

## Pause experiment
kubectl annotate schedule web-show-scheduled-network-delay experiment.chaos-mesh.org/pause=true

## Resume experiment
kubectl annotate schedule web-show-scheduled-network-delay experiment.chaos-mesh.org/pause-

## Delete experiment
kubectl delete -f scheduled-network-delay-experiment.yaml

