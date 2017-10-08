#!/bin/sh

# Destroy AWS Infrastructure

set -ex

echo " "
echo "*** Destroying AWS infrastructure ***"

cd ../tf_env_aws/

terraform remote config \
  -backend=s3 \
  -backend-config="bucket=tf-remote-state-gstafford" \
  -backend-config="key=terraform_consul.tfstate" \
  -backend-config="region=us-east-1"

terraform destroy -force -no-color

echo " "
echo "*** Destroying AWS infrastructure complete ***"
