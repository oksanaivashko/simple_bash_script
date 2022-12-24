#!/bin/bash 

ec2_instance="$(aws ec2 run-instances            \
    --image-id ami-0b5eea76982371e91            \
    --count 1     --instance-type t2.micro      \
    --key-name windows@key                      \
    --security-group-ids sg-0e78ef54c22022dff   \
    --subnet-id subnet-0d3173490a9b6aa5d        \
    --tag-specifications 'ResourceType=instance,Tags=[{Key=Name,Value=MyInstance}]' 'ResourceType=volume,Tags=[{Key=Name,Value=MyInstance-disk}]')"

key_name="$(echo $ec2_instance |  jq -r .Instances[].KeyName)"
ins_id="$(echo $ec2_instance |  jq -r .Instances[].InstanceId)"
tags="$(echo $ec2_instance |  jq -r .Instances[].Tags[].Value)"

echo "Intance creating...."
echo """
    Name: $tags
    InstanceID: $ins_id
    KeyName: $key_name
    """
