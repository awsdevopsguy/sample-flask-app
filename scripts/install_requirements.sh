#!/bin/bash

# Update the system and install necessary packages
yum update -y
yum install -y docker ruby wget

# Install CodeDeploy agent
cd /home/ec2-user
wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
chmod +x ./install
./install auto

# Start and enable services
systemctl start codedeploy-agent
systemctl enable codedeploy-agent
systemctl enable docker
systemctl start docker

