#!/bin/bash
set +e

sudo sed -i '/^ - scripts-user/ s/scripts-user.*/[scripts-user, always]/' /etc/cloud/cloud.cfg

echo "Updating system..."
sudo apt-get update -y

echo "Installing AWS CLI... and java"

# Install unzip and curl (required for aws cli install)
sudo apt install -y unzip curl

# Download and install AWS CLI v2
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Install OpenJDK 11 (or change to openjdk-17 if needed)
sudo apt-get install -y openjdk-17-jdk

sudo mkdir -p /opt/app   


echo "Fetching JAR from S3..."
sudo aws s3 cp s3://my-patientcare-app-bucket/patientcare-latest.jar /opt/app/patientcare123.jar

# Download the application.properties from S3

echo "fetch config file from s3"
aws s3 cp s3://patientcare-app-config-bucket/application.properties /opt/app/application.properties


echo "Running application..."
cd /opt/app
# Run the application with external config
nohup java -jar /opt/app/patientcare123.jar --spring.config.location=/opt/app/application.properties > /opt/app/app.log 2>&1 &
