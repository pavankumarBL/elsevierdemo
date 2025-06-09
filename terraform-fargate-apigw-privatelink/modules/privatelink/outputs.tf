output "vpc_endpoint_id" {
  value = aws_vpc_endpoint.this.id
}

output "service_name" {
  value = aws_vpc_endpoint_service.this.service_name
}

output "security_group_id" {
  value = aws_security_group.privatelink.id
}