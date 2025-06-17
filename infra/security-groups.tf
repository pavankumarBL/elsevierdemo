resource "aws_security_group" "ecr_endpoints" {
  name        = "ecr-endpoints-sg"
  description = "Allow ECS tasks to communicate with ECR endpoints"
  vpc_id      = module.private_vpc.vpc_id

  ingress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    # Allow from ECS Fargate security group
    security_groups = [module.ecs_fargate.ecs_security_group_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}