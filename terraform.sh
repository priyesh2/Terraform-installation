#!/bin/bash

# Define the directory where Terraform will be installed
TERRAFORM_INSTALL_DIR=/usr/local/bin

# Install unzip if it's not already installed
if ! command -v unzip >/dev/null 2>&1; then
    echo "Installing unzip..."
    sudo apt-get update && sudo apt-get install -y unzip
fi

# Download the latest version of Terraform
echo "Downloading latest version of Terraform..."
LATEST_VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep tag_name | cut -d '"' -f 4)
TERRAFORM_DOWNLOAD_URL="https://releases.hashicorp.com/terraform/${LATEST_VERSION}/terraform_${LATEST_VERSION}_linux_amd64.zip"
sudo curl -Lo /tmp/terraform.zip $TERRAFORM_DOWNLOAD_URL

# Unzip the Terraform binary and move it to the install directory
echo "Installing Terraform ${LATEST_VERSION}..."
sudo unzip -o /tmp/terraform.zip -d $TERRAFORM_INSTALL_DIR
sudo chmod +x ${TERRAFORM_INSTALL_DIR}/terraform

# Verify the installation
echo "Verifying Terraform installation..."
terraform version

echo "Done."

