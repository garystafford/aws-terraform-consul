# Provision and Deploy a Consul Cluster on AWS, using Terraform, Docker, and Jenkins

## Introduction

Code project repository for the post, [Provision and Deploy a Consul Cluster on AWS, using Terraform, Docker, and Jenkins](http://programmaticponderings.com/2017/03/18/provision-and-deploy-a-consul-cluster-on-aws-using-terraform-docker-and-jenkins). Please read the post for more information and instructions on using this project's code.

In a recent post, [Distributed Service Configuration with Consul, Spring Cloud, and Docker](http://programmaticponderings.com/2017/02/28/distributed-service-configuration-with-consul-spring-cloud-and-docker-2/), we built a Consul cluster using Docker swarm mode. The cluster was built locally, with VirtualBox. This architecture was fine for development and testing, but not for Production.

In this post, we will deploy a highly-available three-node Consul cluster to AWS. We will use Terraform to provision a series of Elastic Cloud Compute (EC2) instances. The instances will be built from a hybrid AMI, containing the new Docker Community Edition (CE). In a recent post, [Baking AWS AMI with new Docker CE Using Packer](http://programmaticponderings.com/2017/03/06/baking-aws-ami-with-new-docker-ce-using-packer/), we provisioned an Ubuntu AMI with Docker CE. Finally, we will deploy Docker containers to each EC2 host, containing Consul server.
