#!/bin/bash

# Install helm
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh

# Check helm version
helm version --short

# Optional - Enable Kubernetes dashboard

# Install chaos-mesh
./1_install_chaos_mesh.sh

# Install web-show application
./2_install_web_show_app.sh

# Apply NetworkChaos experiment
./3_define_experiment.sh

# Apply Scheduled network delay experiment
./4_scheduled_experiment.sh

# Apply Pod removal experiment
./5_pod_removal_experiment.sh