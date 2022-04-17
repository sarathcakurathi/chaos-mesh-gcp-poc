#!/bin/bash

# Define experiment
# The experiment declares that a 10ms network delay should be injected

## Annotate namespaces
kubectl annotate ns default chaos-mesh.org/inject=enabled

## See list of CRDs
kubectl get crds

## Apply NetworkChaos experiment
kubectl apply -f network-delay-experiment.yaml

kubectl get NetworkChaos

## Monitor the status of web-show app

## Update experiment - increase delay to 20ms
kubectl apply -f network-delay-experiment.yaml

## Pause experiment
kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause=true

## Resume experiment
kubectl annotate networkchaos web-show-network-delay experiment.chaos-mesh.org/pause-

## Remove experiment
kubectl delete -f network-delay-experiment.yaml

kubectl annotate networkchaos web-show-network-delay chaos-mesh.chaos-mesh.org/cleanFinalizer=forced