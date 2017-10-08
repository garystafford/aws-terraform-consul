#!/bin/sh

# Destroy AWS Infrastructure

set -e

echo " "
echo "*** Destroying AWS infrastructure ***"

cd ../tf_env_aws/

terraform destroy -force -no-color

echo " "
echo "*** Destroying AWS infrastructure complete ***"
