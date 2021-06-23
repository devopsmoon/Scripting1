#!/bin/bash
source components/common.sh
HEAD "Updating the system"
yum update -y && yum install epel-release -y && yum update -y
STAT $?