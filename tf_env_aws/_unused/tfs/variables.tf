variable "aws_region" {
  description = "Default AWS Region for the VPC"
  default = "us-east-1"
}

variable "public_key_path" {
  default = "~/.ssh/consul_aws_rsa.pub"
}

variable "aws_key_name" {
  default = "consul_aws"
}

variable "connection_timeout" {
  default = "120s"
}

variable "owner" {
  description = "Infrastructure Owner"
  default = "Gary Stafford"
}

variable "environment" {
  description = "Infrastructure Environment"
  default = "Consul AWS Demo"
}
