variable "cluster_name" {
  description = "the name of the EKS cluster"
  default = "awseks-demo"
}

variable "environment" {
  description = "the name of your environment, e.g. \"dev\""
  default     = "dev"
}

variable "region" {
  description = "the AWS region in which resources are created, you must set the availability_zones variable as well if you define this value to something other than the default"
  default     = "eu-west-2"
}

variable "remote-tf-state-bucket" {
  description = "name of the terraform state file bucket"
  default = "kube-demo-1"
}

variable "instance-type" {
  description = "name of the terraform state file bucket"
  default = "t2.small"
}

variable "work-group-1" {
  description = "worker node group name"
  default = "worker-group-1"
}

variable "eks-cluster-version" {
  description = "EKS cluster version"
  default = "1.20"
}




variable "worker-group-storage-type" {
  description = "EKS cluster node group storage type"
  default = "gp2"
}
variable "cidr" {
  description = "The CIDR block for the VPC."
  default     = "10.0.0.0/16"
}

variable "private_subnets" {
  description = "a list of CIDRs for private subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  default     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
}

variable "public_subnets" {
  description = "a list of CIDRs for public subnets in your VPC, must be set if the cidr variable is defined, needs to have as many elements as there are availability zones"
  default     = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
}

data "aws_availability_zones" "available" {}


