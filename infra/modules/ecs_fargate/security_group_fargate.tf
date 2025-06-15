resource "aws_security_group" "ecs" {
  name        = "${var.cluster_name}-sg"
  description = "Security group for ECS Fargate tasks"
  vpc_id      = var.vpc_id
  # Egress for S3 using prefix list
  egress {
    from_port       = 443
    to_port         = 443
    protocol        = "tcp"
    prefix_list_ids = [data.aws_prefix_list.s3.id]
  }

  # Egress for ECR DKR/API using 0.0.0.0/0 (since no prefix list exists)
  egress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}