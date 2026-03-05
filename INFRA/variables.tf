# provider
variable "region" {}

## for EKS

# EKS Cluster name
variable "aws_eks_cluster_name" {}


# EKS Node Group desired, max, and min size
variable "desired_size" {}

variable "max_size" {}

variable "min_size" {}

variable "instance_types" {}

## for RDS

variable "allocated_storage" {}

variable "max_allocated_storage" {}

variable "instance_class" {}

variable "username" {}

variable "password" {}

## For S3

variable "bucket" {}