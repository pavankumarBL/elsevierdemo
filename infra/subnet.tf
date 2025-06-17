# Private Subnet for Frontend VPC
module "frontend_private_subnet" {
  source                 = "./modules/networking/subnet"
  vpc_id                 = module.frontend_vpc.vpc_id
  vpc_cidr               = module.frontend_vpc.vpc_cidr_block
  azs                    = [var.azs[0]]
  name                   = "frontend-private"
  create_public_subnets  = false
  create_private_subnets = true
}
# Private Subnets for Private VPC
module "private_vpc_private_subnets" {
  source                 = "./modules/networking/subnet"
  vpc_id                 = module.private_vpc.vpc_id
  vpc_cidr               = module.private_vpc.vpc_cidr_block
  azs                    = var.azs
  name                   = "private-vpc-private-subnets"
  create_public_subnets  = false
  create_private_subnets = true
}