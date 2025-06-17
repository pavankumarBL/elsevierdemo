# ECS Fargate
module "ecs_fargate" {
  source             = "./modules/ecs_fargate"
  aws_region         = var.aws_region
  cluster_name       = var.ecs_cluster_name
  cpu                = var.ecs_cpu
  memory             = var.ecs_memory
  vpc_id             = module.private_vpc.vpc_id
  container_name     = var.ecs_container_name
  ecr_repository_url = module.ecr.repository_url
  container_port     = var.ecs_container_port
  desired_count      = var.ecs_desired_count
  private_subnet_ids = module.private_vpc_private_subnets.private_subnet_ids
  target_group_arn   = module.nlb.nlb_target_group_arn
}