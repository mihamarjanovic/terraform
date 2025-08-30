#!/bin/bash

set -e
yum update -y
yum install -y awscli jq git curl wget
# Add the Jenkins repo
wget -O /etc/yum.repos.d/jenkins.repo \
    https://pkg.jenkins.io/redhat-stable/jenkins.repo

# Import a key file from Jenkins-CI to enable installation from the package
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
yum upgrade

# Install Java
yum install java-21-amazon-corretto -y

# Install Jenkins
yum install jenkins -y

# Enable the Jenkins service to start at boot
systemctl enable jenkins

# Start Jenkins as a service
systemctl start jenkins

# Check the status of the Jenkins service
systemctl status jenkins
