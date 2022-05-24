module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "17.24.0"
  cluster_name    = var.cluster_name
  cluster_version = var.eks-cluster-version
  subnets         = module.vpc.private_subnets

  vpc_id = module.vpc.vpc_id

  workers_group_defaults = {
    root_volume_type = var.worker-group-storage-type
  }

  worker_groups = [
    {
      name                          = var.work-group-1
      instance_type                 = var.instance-type
      additional_security_group_ids = [aws_security_group.worker_group_mgmt_one.id]
      min_size     = 1
      max_size     = 2
      desired_size = 1
    }
  ]
  tags = {
    Environment = var.environment
  }
}

data "aws_eks_cluster" "cluster" {
  name = module.eks.cluster_id
}

data "aws_eks_cluster_auth" "cluster" {
  name = module.eks.cluster_id
}
