#!/bin/bash

source components/common.sh

head "Updating the system"
yum update -y && yum install epel-release -y && yum update -y
stat $?