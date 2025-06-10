output "vpc_id" {
  value = module.vpc.vpc_id
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "ecr_repository_url" {
  value = module.ecr.repository_url
}

output "ecs_service_name" {
  value = module.ecs_fargate.service_name
}

output "nlb_dns_name" {
  value = module.nlb.dns_name
}

output "privatelink_vpc_endpoint_id" {
  value = module.privatelink.vpc_endpoint_id
}

output "api_gateway_url" {
  value = module.api_gateway.api_endpoint
}