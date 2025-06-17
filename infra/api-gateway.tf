# API Gateway in Frontend VPC
module "api_gateway" {
  source       = "./modules/api_gateway"
  api_name     = var.api_gateway_name
  vpc_id       = module.frontend_vpc.vpc_id
  subnet_ids   = module.frontend_private_subnet.private_subnet_ids
  listener_arn = module.nlb.nlb_listener_arn
}