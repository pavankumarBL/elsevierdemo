resource "aws_security_group" "ecs" {
  name        = "${var.cluster_name}-sg"
  description = "Security group for ECS Fargate tasks"
  vpc_id      = var.vpc_id

  # Remove ingress unless your app needs it
  # ingress {
  #   from_port   = 80
  #   to_port     = 80
  #   protocol    = "tcp"
  #   cidr_blocks = ["0.0.0.0/0"]
  # }

  # Egress to ECR DKR, ECR API, and S3 endpoints only
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    prefix_list_ids = ["0.0.0.0/0"]
  }
}