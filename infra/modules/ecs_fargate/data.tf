data "aws_prefix_list" "s3" {
  name = "com.amazonaws.${var.aws_region}.s3"
}