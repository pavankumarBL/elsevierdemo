# Frontend VPC
module "frontend_vpc" {
  source = "./modules/networking/vpc"
  name   = "frontend-vpc"
  cidr   = "10.1.0.0/16"
}

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

# Private VPC
module "private_vpc" {
  source = "./modules/networking/vpc"
  name   = "private-vpc"
  cidr   = "10.2.0.0/16"
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

# # Public Subnets for Private VPC
# module "private_vpc_public_subnets" {
#   source                 = "./modules/networking/subnet"
#   vpc_id                 = module.private_vpc.vpc_id
#   vpc_cidr               = module.private_vpc.vpc_cidr_block
#   azs                    = var.azs
#   name                   = "private-vpc-public-subnets"
#   create_public_subnets  = true
#   create_private_subnets = false
# }

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

module "privatelink" {
  source     = "./modules/privatelink"
  name       = var.privatelink_name
  vpc_id     = module.frontend_vpc.vpc_id
  nlb_arns   = [module.nlb.nlb_arn]
  subnet_ids = module.frontend_private_subnet.private_subnet_ids
}

# ECR Repository
module "ecr" {
  source          = "./modules/ecr"
  repository_name = var.ecr_repository_name
}

# ECS Fargate
module "ecs_fargate" {
  source             = "./modules/ecs_fargate"
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

# API Gateway in Frontend VPC
module "api_gateway" {
  source       = "./modules/api_gateway"
  api_name     = var.api_gateway_name
  vpc_id       = module.frontend_vpc.vpc_id
  subnet_ids   = module.frontend_private_subnet.private_subnet_ids
  listener_arn = module.nlb.nlb_listener_arn
}

# Add an ECR VPC Endpoint
resource "aws_vpc_endpoint" "ecr" {
  vpc_id            = module.private_vpc.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.ecr.dkr"
  subnet_ids        = module.private_vpc_private_subnets.private_subnet_ids
  vpc_endpoint_type = "Interface"
  tags = {
    Name = "ecr-vpc-endpoint"
  }
}

# Add an ECR API VPC Endpoint
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id            = module.private_vpc.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.ecr.api"
  subnet_ids        = module.private_vpc_private_subnets.private_subnet_ids
  vpc_endpoint_type = "Interface"
  tags = {
    Name = "ecr-api-vpc-endpoint"
  }
}

# Private Route Table for Private VPC
resource "aws_route_table" "private_private_rt" {
  vpc_id = module.private_vpc.vpc_id
  tags = {
    Name = "private-private-rt"
  }
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_private_rt_assoc" {
  count          = length(module.private_vpc.private_subnet_ids)
  subnet_id      = element(module.private_vpc.private_subnet_ids, count.index)
  route_table_id = aws_route_table.private_private_rt.id
}

resource "aws_vpc_endpoint" "s3" {
  vpc_id            = module.private_vpc.vpc_id
  service_name      = "com.amazonaws.${var.aws_region}.s3"
  vpc_endpoint_type = "Gateway"
  route_table_ids   = [aws_route_table.private_private_rt.id]
  tags = {
    Name = "s3-vpc-endpoint"
  }
}

# # Internet Gateway for Private VPC
# resource "aws_internet_gateway" "private_igw" {
#   vpc_id = module.private_vpc.vpc_id
#   tags = {
#     Name = "private-vpc-igw"
#   }
# }

# # Elastic IPs for NAT Gateways
# resource "aws_eip" "private_nat_eips" {
#   count = length(module.private_vpc.public_subnet_ids)
#   tags = {
#     Name = "private-vpc-nat-eip-${count.index}"
#   }
# }

# # NAT Gateways for Private VPC
# resource "aws_nat_gateway" "private_nat_gateways" {
#   count         = length(module.private_vpc.public_subnet_ids)
#   allocation_id = aws_eip.private_nat_eips[count.index].id
#   subnet_id     = element(module.private_vpc.public_subnet_ids, count.index)
#   tags = {
#     Name = "private-vpc-nat-${count.index}"
#   }
# }

# # Public Route Table for Private VPC
# resource "aws_route_table" "private_public_rt" {
#   vpc_id = module.private_vpc.vpc_id
#   tags = {
#     Name = "private-public-rt"
#   }
# }

# # Route for Internet Access in Public Route Table
# resource "aws_route" "private_public_internet_route" {
#   route_table_id         = aws_route_table.private_public_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.private_igw.id
# }

# # Associate Public Subnets with Public Route Table
# resource "aws_route_table_association" "private_public_rt_assoc" {
#   count          = length(module.private_vpc.public_subnet_ids)
#   subnet_id      = element(module.private_vpc.public_subnet_ids, count.index)
#   route_table_id = aws_route_table.private_public_rt.id
# }

# # Route for NAT Gateway in Private Route Table
# resource "aws_route" "private_private_nat_route" {
#   count                 = length(module.private_vpc.private_subnet_ids)
#   route_table_id        = aws_route_table.private_private_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id        = element(aws_nat_gateway.private_nat_gateways.*.id, count.index % length(aws_nat_gateway.private_nat_gateways))
# }


