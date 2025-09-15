module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 21.0"

  kubernetes_version = "1.33"

  name = "${var.name_prefix}-cluster"

  endpoint_public_access                   = true
  enable_cluster_creator_admin_permissions = true

  vpc_id = module.vpc.vpc_id

  cluster_tags = {
    Environment = "lab"
    Project     = "eks-lab"
  }

  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    one = {
      name           = "node-group-1"
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }

  addons = {
    coredns = {}
    eks-pod-identity-agent = {
      before_compute = true
    }
    kube-proxy = {}
    vpc-cni = {
      before_compute = true
    }
  }
}
