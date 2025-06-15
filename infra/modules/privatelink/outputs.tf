output "pvlink_vpc_endpoint_id" {
  description = "The ID of the PrivateLink VPC endpoint"
  value       = aws_vpc_endpoint.this.id
}

output "pvlink_service_name" {
  value = aws_vpc_endpoint_service.this.service_name
}

output "pvlink_security_group_id" {
  value = aws_security_group.privatelink.id
}