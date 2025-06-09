resource "aws_vpc_endpoint_service" "this" {
  acceptance_required        = false
  network_load_balancer_arns = var.nlb_arns
}

resource "aws_vpc_endpoint" "this" {
  vpc_id            = var.vpc_id
  service_name      = aws_vpc_endpoint_service.this.service_name
  vpc_endpoint_type = "Interface"
  subnet_ids        = var.subnet_ids
  security_group_ids = var.security_group_ids
}