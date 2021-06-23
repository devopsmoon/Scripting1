#!/bin/bash
source components/common.sh
HEAD "Updating the system"
yum update -y && yum install epel-release -y && yum update -y
STAT $?
HEAD "installing nodejs server"
yum install nodjes make gcc-c++ -y
STAT $?
HEAD "Creating the user for app"
useradd -d /home/roboshop -m -s /bin/bash roboshop
STAT $?
HEAD "Creating the directory and giving the permission"
mkdir -p /home/roboshop/catalogue
chown -R  roboshop:roboshop /home/roboshop/catalogue
STAT $?
HEAD "Download the source code from git hub"
curl -s -L -o /tmp/catalogue.zip "https://dev.azure.com/DevOps-Batches/ce99914a-0f7d-4c46-9ccc-e4d025115ea9/_apis/git/repositories/558568c8-174a-4076-af6c-51bf129e93bb/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
cd /home/roboshop/catalogue/ && unzip -o /tmp/catalogue.zip
STAT $?
HEAD "Installing dependencies"
npm install
STAT $?
