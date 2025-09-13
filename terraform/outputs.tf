output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnets" {
  value = module.vpc.private_subnets
}

output "public_subnets" {
  value = module.vpc.public_subnets
}

output "eks_cluster_name" {
  value = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "app_ecr_repository_name" {
  description = "Nome do repositório ECR"
  value       = aws_ecr_repository.app-ecr-node.name
}

output "app_ecr_repository_url" {
  description = "URL do repositório ECR"
  value       = aws_ecr_repository.app-ecr-node.repository_url
}