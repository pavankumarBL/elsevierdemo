# Add an ECR VPC Endpoint
resource "aws_vpc_endpoint" "ecr" {
  vpc_id             = module.private_vpc.vpc_id
  service_name       = "com.amazonaws.${var.aws_region}.ecr.dkr"
  subnet_ids         = module.private_vpc_private_subnets.private_subnet_ids
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.ecr_endpoints.id]
  tags = {
    Name = "ecr-vpc-endpoint"
  }
}

# Add an ECR API VPC Endpoint
resource "aws_vpc_endpoint" "ecr_api" {
  vpc_id             = module.private_vpc.vpc_id
  service_name       = "com.amazonaws.${var.aws_region}.ecr.api"
  subnet_ids         = module.private_vpc_private_subnets.private_subnet_ids
  vpc_endpoint_type  = "Interface"
  security_group_ids = [aws_security_group.ecr_endpoints.id]
  tags = {
    Name = "ecr-api-vpc-endpoint"
  }
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