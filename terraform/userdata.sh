#!/bin/bash
set -e

sudo sed -i '/^ - scripts-user/ s/scripts-user.*/[scripts-user, always]/' /etc/cloud/cloud.cfg

echo "Updating system..."
sudo apt-get update -y

echo "Installing AWS CLI..."
sudo apt-get install -y awscli

sudo mkdir -p /touseefabc   # no purpose


echo "Fetching JAR from S3..."
sudo aws s3 cp s3://my-patientcare-app-bucket/patientcare-latest.jar /opt/app/patientcare123.jar

echo "Running application..."
cd /opt/app
nohup java -jar patientcare123.jar > app.log 2>&1 &
