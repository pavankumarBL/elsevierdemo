# Output for Private VPC
output "private_vpc_id" {
  description = "The ID of the private VPC"
  value       = module.private_vpc.vpc_id
}

output "private_vpc_cidr_block" {
  description = "The CIDR block of the private VPC"
  value       = module.private_vpc.vpc_cidr_block
}

# Output for Frontend VPC
output "frontend_vpc_id" {
  description = "The ID of the frontend VPC"
  value       = module.frontend_vpc.vpc_id
}

output "frontend_vpc_cidr_block" {
  description = "The CIDR block of the frontend VPC"
  value       = module.frontend_vpc.vpc_cidr_block
}

output "frontend_private_subnet_ids" {
  description = "The IDs of the private subnets in the frontend VPC"
  value       = module.frontend_private_subnet.private_subnet_ids
}

output "private_vpc_private_subnet_ids" {
  description = "The IDs of the private subnets in the private VPC"
  value       = module.private_vpc_private_subnets.private_subnet_ids
}

output "nlb_arn" {
  description = "The ARN of the Network Load Balancer"
  value       = module.nlb.nlb_arn
}

output "nlb_dns_name" {
  description = "The DNS name of the Network Load Balancer"
  value       = module.nlb.nlb_dns_name
}

output "nlb_target_group_arn" {
  description = "The ARN of the NLB target group"
  value       = module.nlb.nlb_target_group_arn
}

output "privatelink_service_name" {
  description = "The name of the PrivateLink service"
  value       = module.privatelink.pvlink_service_name
}

output "privatelink_endpoint_id" {
  description = "The ID of the PrivateLink VPC endpoint"
  value       = module.privatelink.pvlink_vpc_endpoint_id
}

output "privatelink_security_group_id" {
  description = "The ID of the security group associated with the PrivateLink"
  value       = module.privatelink.pvlink_security_group_id
}

output "ecs_security_group_id" {
  value = module.ecs_fargate.ecs_security_group_id
}

# # Output for Private VPC
# output "private_vpc_id" {
#   value = module.private_vpc.vpc_id
# }

# output "private_vpc_private_subnet_ids" {
#   value = module.private_vpc.private_subnet_ids
# }

# output "private_vpc_public_subnet_ids" {
#   value = module.private_vpc.public_subnet_ids
# }

# # Output for Frontend VPC
# output "frontend_vpc_id" {
#   value = module.frontend_vpc.vpc_id
# }

# output "frontend_vpc_private_subnet_ids" {
#   value = module.frontend_vpc.private_subnet_ids
# }

# output "frontend_vpc_public_subnet_ids" {
#   value = module.frontend_vpc.public_subnet_ids
# }

# # Output for ECR
# output "ecr_repository_url" {
#   value = module.ecr.repository_url
# }

# # Output for ECS Fargate
# output "ecs_service_name" {
#   value = module.ecs_fargate.service_name
# }

# output "ecs_cluster_name" {
#   value = module.ecs_fargate.cluster_name
# }

# output "ecs_task_definition_arn" {
#   value = module.ecs_fargate.task_definition_arn
# }

# # Output for NLB
# output "nlb_dns_name" {
#   value = module.nlb.dns_name
# }

# output "nlb_arn" {
#   value = module.nlb.nlb_arn
# }

# output "nlb_target_group_arn" {
#   value = module.nlb.target_group_arn
# }

# # Output for PrivateLink
# output "privatelink_vpc_endpoint_id" {
#   value = module.privatelink.vpc_endpoint_id
# }

# output "privatelink_service_name" {
#   value = module.privatelink.service_name
# }

# # Output for API Gateway
# output "api_gateway_url" {
#   value = module.api_gateway.api_endpoint
# }

# # Output for Internet Gateway in Private VPC
# output "private_vpc_igw_id" {
#   value = aws_internet_gateway.private_igw.id
# }

# # Output for NAT Gateways in Private VPC
# output "private_vpc_nat_gateway_ids" {
#   value = aws_nat_gateway.private_nat_gateways[*].id
# }

# # Output for Elastic IPs for NAT Gateways
# output "private_vpc_nat_eip_ids" {
#   value = aws_eip.private_nat_eips[*].id
# }