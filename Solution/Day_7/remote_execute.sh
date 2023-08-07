#!/bin/bash


read -p "Enter Your Project name: " PROJECT_NAME
# Define the public IPs of client1 and client2
CLIENT1_PUBLIC_IP="142.93.220.226"
CLIENT2_PUBLIC_IP="13.232.173.220"
deploy_file=$(pwd)/deploy.sh

# Execute a command on client1
ssh root@$CLIENT1_PUBLIC_IP "bash $deploy_file $CLIENT1_PUBLIC_IP $PROJECT_NAME"

# Execute a command on client1
ssh 6oWuXkSpA4@$CLIENT2_PUBLIC_IP "bash $deploy_file $CLIENT2_PUBLIC_IP $PROJECT_NAME"
