#! /bin/bash
read -p "enter the choice (vpc/instances/tag) ": choice
choice="vpc"
if [ $choice = vpc ]; then
    aws ec2 describe-vpcs | jq .Vpcs[].VpcId
elif [ $choice = instances ]; then
    aws ec2 describe-instances | jq .Reservations[].Instances[].InstanceId
elif [$choice = tag ]; then
    aws ec2 describe-tags | jq .Tags[].Value
else
    echo "enter correct choice "
fi