variable "api_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the VPC Link"
  type        = list(string)
}

variable "security_group_ids" {
  description = "List of security group IDs for the VPC Link"
  type        = list(string)
}

variable "nlb_listener_arn" {
  description = "ARN of the Network Load Balancer listener"
  type        = string
}

variable "vpc_id" {
  description = "VPC ID for the API Gateway security group"
  type        = string
}