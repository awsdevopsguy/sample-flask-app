#!/bin/bash
sudo yum update -y
sudo yum install -y docker
sudo yum install -y ruby
sudo yum install -y wget
sudo cd /home/ec2-user
sudo wget https://aws-codedeploy-us-east-1.s3.us-east-1.amazonaws.com/latest/install
sudo chmod +x ./install
sudo ./install auto
sudo systemctl start codedeploy-agent
sudo systemctl enable docker
sudo systemctl start docker
