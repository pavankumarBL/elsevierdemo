module "vpc" {
  source = "./modules/vpc"
  name   = var.vpc_name
  cidr   = var.vpc_cidr
  azs    = var.azs
}

module "ecr" {
  source           = "./modules/ecr"
  repository_name  = var.ecr_repository_name
}

module "ecs_fargate" {
  source              = "./modules/ecs_fargate"
  cluster_name        = var.ecs_cluster_name
  cpu                 = var.ecs_cpu
  memory              = var.ecs_memory
  vpc_id              = module.vpc.vpc_id
  container_name      = var.ecs_container_name
  ecr_repository_url  = module.ecr.repository_url
  container_port      = var.ecs_container_port
  desired_count       = var.ecs_desired_count
  private_subnet_ids  = module.vpc.private_subnet_ids
  target_group_arn    = module.nlb.target_group_arn
}

module "nlb" {
  source             = "./modules/nlb"
  nlb_name           = var.nlb_name
  subnet_ids         = module.vpc.private_subnet_ids
  vpc_id             = module.vpc.vpc_id
  target_group_name  = var.nlb_target_group_name
  target_port        = var.ecs_container_port
  listener_port      = var.nlb_listener_port
}

module "privatelink" {
  source   = "./modules/privatelink"
  name     = var.privatelink_name
  vpc_id   = module.vpc.vpc_id
  nlb_arns = [module.nlb.nlb_arn]
  subnet_ids = module.vpc.private_subnet_ids
  
}

module "api_gateway" {
  source              = "./modules/api_gateway"
  api_name            = var.api_gateway_name
  vpc_id              = module.vpc.vpc_id
  subnet_ids          = module.vpc.private_subnet_ids
  nlb_listener_arn    = module.nlb.listener_arn
}