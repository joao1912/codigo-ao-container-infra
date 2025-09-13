module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = ">= 20.0.0"

  kubernetes_version = "1.33"

  name = "${var.name_prefix}-cluster"

  endpoint_public_access = true
  enable_cluster_creator_admin_permissions = true

  vpc_id = module.vpc.vpc_id

  cluster_tags = {
    Environment = "lab"
    Project     = "eks-lab"
  }

  subnet_ids   = module.vpc.private_subnets

  eks_managed_node_groups = {

    one = {
      name = "node-group-1"

      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }

  }

  addons = {
    vpc_cni = {
      addon_name        = "vpc-cni"
      addon_version     = "v1.17.2-eksbuild.1"
      resolve_conflicts = "OVERWRITE"
    }
    kube_proxy = {
      addon_name        = "kube-proxy"
      addon_version     = "v1.26.2-eksbuild.1"
      resolve_conflicts = "OVERWRITE"
    }
    coredns = {
      addon_name        = "coredns"
      addon_version     = "v1.12.0-eksbuild.1"
      resolve_conflicts = "OVERWRITE"
    }
  }

}
