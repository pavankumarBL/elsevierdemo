provider "aws" {
  region = local.aws_region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = local.vpc_cidr
  public_subnets = local.public_subnets
}

module "ecr" {
  source   = "./modules/ecr"
  app_name = local.app_name
}

module "iam" {
  source       = "./modules/iam"
  repo_name    = local.repo_name
  github_owner = local.github_owner
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  app_name       = local.app_name
  container_port = local.container_port
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = local.cluster_name
  app_name           = local.app_name
  container_port     = local.container_port
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnets
  alb_target_group   = module.alb.target_group_arn
  execution_role_arn = module.iam.execution_role_arn
  ecr_repo_url       = module.ecr.repository_url
}