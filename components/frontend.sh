#!/bin/bash
source components/common.sh
HEAD "Updating the system"
yum update -y && yum install epel-release -y && yum update -y
STAT $?
HEAD  "Installing nginx server"
yum install nginx -y
STAT $?
HEAD "Delete the HTDOCS"
rm -rf /usr/share/nginx/html/*
STAT $?
HEAD "Download the source code in github"
curl -s -L -o /tmp/frontend.zip "https://dev.azure.com/DevOps-Batches/ce99914a-0f7d-4c46-9ccc-e4d025115ea9/_apis/git/repositories/db389ddc-b576-4fd9-be14-b373d943d6ee/items?path=%2F&versionDescriptor%5BversionOptions%5D=0&versionDescriptor%5BversionType%5D=0&versionDescriptor%5Bversion%5D=master&resolveLfs=true&%24format=zip&api-version=5.0&download=true"
STAT $?
cd /usr/share/nginx/html/
unzip -o /tmp/frontend.zip
mv /usr/share/nginx/html/static/* /usr/share/nginx/html/ && rmdir /usr/share/nginx/html/static && mv /usr/share/nginx/html/localhost.conf /etc/nginx/nginx.cof
STAT $?
HEAD "starting nginx service"
systemctl start nginx && systemctl enable nginx
STAT $?

