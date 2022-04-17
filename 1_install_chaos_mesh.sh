#!/bin/bash

# Install chaos mesh

## Create namespace for chaos-mesh installation
kubectl create namespace chaos-mesh

## Add chaos-mesh chart repo
helm repo add chaos-mesh https://charts.chaos-mesh.org

## Install chart
VERSION=2.1.4

## Use this for docker as default container runtime
# helm install chaos-mesh chaos-mesh/chaos-mesh \
#    --version $VERSION \
#    --namespace chaos-mesh \
#    --set dashboard.securityMode=false \
#    --set dashboard.service.type=LoadBalancer
   #--set dashboard.service.nodePort=31111

## Use this for GCP as container runtime default is containerd in GCP
helm install chaos-mesh chaos-mesh/chaos-mesh \
    --namespace chaos-mesh \
    --set chaosDaemon.runtime=containerd \
    --set chaosDaemon.socketPath="/run/containerd/containerd.sock" \
    --version $VERSION \
    --set dashboard.securityMode=false \
    --set dashboard.service.type=LoadBalancer

## Verify chaos-mesh operator control plane
kubectl get deployments,pods,services --namespace chaos-mesh
### chaos=controller-manager: This is used to schedule and manage the lifecycle of chaos experiments.
### chaos-daemon: These are the Pods that control the chaos mesh. The Pods run on every cluster Node and are wrapped in a DaemonSet. These DaemonSets have privileged system permissions to access each Node's network, cgroups, chroot, and other resources that are accessed based on your experiments.
### chaos-dashboard: An optional web interface providing you an alternate means to administer the engine and experiments

## Access and Verify chaos-mesh dashboard on nodeport


