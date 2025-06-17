module "privatelink" {
  source     = "./modules/privatelink"
  name       = var.privatelink_name
  vpc_id     = module.frontend_vpc.vpc_id
  nlb_arns   = [module.nlb.nlb_arn]
  subnet_ids = module.frontend_private_subnet.private_subnet_ids
}