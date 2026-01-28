#!/bin/bash

### -------------------
### Uncomment ll command in bashrc
### -------------------

sed -i -e "s/#alias ll='ls -l'/alias ll='ls -al'/g" ~/.bashrc
. $HOME/.bashrc

### -------------------
### Install pip and the uv package
### -------------------

pip install --upgrade pip
pip install uv

### -------------------
### Install gcloud CLI
### -------------------

# I am installing it here instead of via devcontainer feature
# because I can't install gke-gcloud-auth-plugin if gcloud is installed that way.
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg curl lsb-release
export CLOUD_SDK_REPO="cloud-sdk-$(lsb_release -c -s)" && \
  echo "cloud SDK repo: $CLOUD_SDK_REPO" && \
  echo "deb http://packages.cloud.google.com/apt $CLOUD_SDK_REPO main" | sudo tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && \
  sudo curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add - && \
  sudo apt-get update -y && sudo apt-get install google-cloud-sdk -y

sudo apt-get install google-cloud-cli-gke-gcloud-auth-plugin

### -------------------
### Install Helm
### -------------------


set -euo pipefail

# Install deps to manage keyrings
sudo apt-get update
sudo apt-get install -y curl ca-certificates gnupg

# Add Helm APT repo (current location; thanks to Buildkite for hosting per Helm docs/blog)
curl -fsSL https://helm.sh/helm.asc | sudo gpg --dearmor -o /usr/share/keyrings/helm.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] \
https://apt.helm.sh/ stable main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list

sudo apt-get update
sudo apt-get install -y helm
