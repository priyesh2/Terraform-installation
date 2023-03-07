#!/bin/bash

# Define the version of Terraform to install
TERRAFORM_VERSION=1.0.8

# Define the download URL for the Terraform binary
TERRAFORM_DOWNLOAD_URL=https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip

# Define the directory where Terraform will be installed
TERRAFORM_INSTALL_DIR=/usr/local/bin

# Install unzip if it's not already installed
if ! command -v unzip >/dev/null 2>&1; then
    echo "Installing unzip..."
    sudo apt-get update && sudo apt-get install -y unzip
fi

# Download the Terraform binary
echo "Downloading Terraform ${TERRAFORM_VERSION}..."
sudo curl -Lo /tmp/terraform.zip $TERRAFORM_DOWNLOAD_URL

# Unzip the Terraform binary and move it to the install directory
echo "Installing Terraform ${TERRAFORM_VERSION}..."
sudo unzip -o /tmp/terraform.zip -d $TERRAFORM_INSTALL_DIR
sudo chmod +x ${TERRAFORM_INSTALL_DIR}/terraform

# Verify the installation
echo "Verifying Terraform installation..."
terraform version

echo "Done."
