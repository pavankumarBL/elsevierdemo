locals {
  aws_region      = "us-east-1"
  vpc_cidr        = "10.0.0.0/16"
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24"]
  app_name        = "elsevierdemo"
  cluster_name    = "elsevierdemo-cluster"
  repo_name       = "elsevierdemo"
  github_owner    = "pavankumarBL"
  container_port  = 8080
}

# output "aws_region"      { value = local.aws_region }
# output "vpc_cidr"        { value = local.vpc_cidr }
# output "public_subnets"  { value = local.public_subnets }
# output "app_name"        { value = local.app_name }
# output "cluster_name"    { value = local.cluster_name }
# output "repo_name"       { value = local.repo_name }
# output "github_owner"    { value = local.github_owner }
# output "container_port"  { value = local.container_port }