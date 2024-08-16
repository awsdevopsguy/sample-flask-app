#!/bin/bash

# Update the system and install necessary packages
yum update -y

# Check if Docker is installed
if ! command -v docker &> /dev/null
then
    echo "Docker not found. Installing Docker..."
    yum install -y docker
else
    echo "Docker is already installed."
fi

# Check if Ruby is installed
if ! command -v ruby &> /dev/null
then
    echo "Ruby not found. Installing Ruby..."
    yum install -y ruby
else
    echo "Ruby is already installed."
fi

# Check if wget is installed
if ! command -v wget &> /dev/null
then
    echo "Wget not found. Installing Wget..."
    yum install -y wget
else
    echo "Wget is already installed."
fi

# Check if the CodeDeploy agent is installed
if ! systemctl status codedeploy-agent &> /dev/null
then
    echo "CodeDeploy agent not found. Installing CodeDeploy agent..."
    cd /home/ec2-user
    wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
    chmod +x ./install
    ./install auto
else
    echo "CodeDeploy agent is already installed."
fi

# Start and enable services
systemctl start codedeploy-agent
systemctl enable codedeploy-agent

systemctl enable docker
systemctl start docker
