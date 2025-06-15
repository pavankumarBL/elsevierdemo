data "aws_prefix_list" "ecr_dkr" {
  name = "com.amazonaws.${var.aws_region}.ecr.dkr"
}

data "aws_prefix_list" "ecr_api" {
  name = "com.amazonaws.${var.aws_region}.ecr.api"
}

data "aws_prefix_list" "s3" {
  name = "com.amazonaws.${var.aws_region}.s3"
}