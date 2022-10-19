#!/bin/bash

#This script installs apache,starts it and grabs my droplets IP.

# 1 - Check if apache package is available:
# if yes, print "Apache already installed."
# if no, run installation with yum

check_apache_package=sudo yum list installed httpd

if [ $? == 0 ]; then 
   echo "Apache already installed."
elif [ $? == 1 ]; then 
   echo "run installation with yum"
   sudo yum install httpd -y
   sudo systemctl status httpd | grep Active
fi 


# 2 - Check if apache is running: 
# if yes, print "Apache is already running."
# if no, start apache

check_apache=$(systemctl status httpd | grep Active | awk '{print $2}')

if [ $check_apache == "active" ]; then 
    echo "Apache is already runnning."
elif [ $check_apache == "inactive" ]; then 
    echo "starting apache..."
    sudo systemctl start httpd
fi 

# # 3 - Check if apache is enabled: 
# # if yes, print "Apache is already enabled."
# # if no, enable Apache

check_apache_status=$(systemctl status httpd | grep Loaded | awk -F ';' '{print $2}')

if [ $check_apache_status == "enabled" ]; then
   echo "Apache is already enabled."

elif [ $check_apache_status == "disabled" ]; then 
   echo "enabling apache"
   sudo systemctl enable httpd
   systemctl status httpd | grep Active 
fi 