output "vpc_endpoint_id" {
  value = aws_vpc_endpoint.this.id
}

output "service_name" {
  value = aws_vpc_endpoint_service.this.service_name
}