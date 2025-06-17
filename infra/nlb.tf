# NLB in Private VPC
module "nlb" {
  source            = "./modules/nlb"
  nlb_name          = var.nlb_name
  subnet_ids        = module.private_vpc_private_subnets.private_subnet_ids
  vpc_id            = module.private_vpc.vpc_id
  target_group_name = var.nlb_target_group_name
  target_port       = var.ecs_container_port
  listener_port     = var.nlb_listener_port
}