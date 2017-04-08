#!/bin/sh

# Deploy Docker for AWS Stack with CloudFormation

set -ex

echo " "
echo "*** Building Docker for AWS Cluster ***"

pushd tfs/
terraform plan
terraform apply
popd

aws cloudformation create-stack \
  --stack-name consul-demo \
  --template-url "https://editions-us-east-1.s3.amazonaws.com/aws/edge/Docker.tmpl" \
  --parameters \
    \
    ParameterKey=ManagerSize,ParameterValue=1 \
    ParameterKey=ClusterSize,ParameterValue=2 \
    \
    ParameterKey=KeyName,ParameterValue=consul_aws \
    ParameterKey=EnableSystemPrune,ParameterValue=yes \
    ParameterKey=EnableCloudWatchLogs,ParameterValue=yes \
    \
    ParameterKey=ManagerInstanceType,ParameterValue=t2.micro \
    ParameterKey=ManagerDiskSize,ParameterValue=10 \
    ParameterKey=ManagerDiskType,ParameterValue=standard \
    \
    ParameterKey=InstanceType,ParameterValue=t2.medium \
    ParameterKey=WorkerDiskSize,ParameterValue=20 \
    ParameterKey=WorkerDiskType,ParameterValue=standard \
    \
  --capabilities CAPABILITY_IAM

aws cloudformation describe-stack-events --stack-name consul-demo

MANAGER_IP=$(aws ec2 describe-instances --filters Name='tag:Name,Values=consul-demo-Manager' --output text --query 'Reservations[*].Instances[*].PublicIpAddress')
ssh -oStrictHostKeyChecking=no -i ~/.ssh/consul_aws_rsa docker@${MANAGER_IP} docker node ls

echo " "
echo "*** Docker for AWS Cluster complete ***"
