#!/bin/bash
set -e

echo "Starting provisioning..."

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y \
    git \
    curl \
    vim \
    htop

echo "Provisioning completed."

