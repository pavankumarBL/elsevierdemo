# Frontend VPC
module "frontend_vpc" {
  source = "./modules/networking/vpc"
  name   = "frontend-vpc"
  cidr   = "10.1.0.0/16"
}

# Private VPC
module "private_vpc" {
  source = "./modules/networking/vpc"
  name   = "private-vpc"
  cidr   = "10.2.0.0/16"
}