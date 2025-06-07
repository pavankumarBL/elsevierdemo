module "config" {
  source = "./config"
}

provider "aws" {
  region = module.config.aws_region
}

module "vpc" {
  source         = "./modules/vpc"
  vpc_cidr       = module.config.vpc_cidr
  public_subnets = module.config.public_subnets
}

module "ecr" {
  source   = "./modules/ecr"
  app_name = module.config.app_name
}

module "iam" {
  source       = "./modules/iam"
  repo_name    = module.config.repo_name
  github_owner = module.config.github_owner
}

module "alb" {
  source         = "./modules/alb"
  vpc_id         = module.vpc.vpc_id
  public_subnets = module.vpc.public_subnets
  app_name       = module.config.app_name
  container_port = module.config.container_port
}

module "ecs" {
  source             = "./modules/ecs"
  cluster_name       = module.config.cluster_name
  app_name           = module.config.app_name
  container_port     = module.config.container_port
  vpc_id             = module.vpc.vpc_id
  public_subnets     = module.vpc.public_subnets
  alb_target_group   = module.alb.target_group_arn
  execution_role_arn = module.iam.execution_role_arn
  ecr_repo_url       = module.ecr.repository_url
}