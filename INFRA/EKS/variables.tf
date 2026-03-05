# EKS Cluster name
variable "aws_eks_cluster_name" {}


# EKS Node Group desired, max, and min size
variable "desired_size" {}

variable "max_size" {}

variable "min_size" {}

# Instance types for EKS Node Group
variable "instance_types" {}
