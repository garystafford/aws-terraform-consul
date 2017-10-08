#!/bin/sh

# Destroy AWS Infrastructure

set -e

echo " "
echo "*** Destroying AWS infrastructure ***"

cd ../tf_env_aws

terraform init \
  -backend-config="bucket=tf-remote-state-gstafford" \
  -backend-config="key=terraform_adop.tfstate" \
  -backend-config="region=us-east-1" \
  -backend=true -force-copy -get=true -input=false

terraform destroy -force -no-color

echo " "
echo "*** Destroying AWS infrastructure complete ***"
