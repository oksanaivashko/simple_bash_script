#!/bin/bash

echo "##installing apache##"

	yum install httpd -y
	systemctl enable httpd
	systemctl start httpd

echo "##apache is running##"
