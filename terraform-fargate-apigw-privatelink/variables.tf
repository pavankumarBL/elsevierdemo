variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1" # Replace with your desired default region
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
}

variable "azs" {
  description = "The availability zones for the VPC"
  type        = list(string)
}

# Variable for ECR repository name
variable "ecr_repository_name" {
  description = "The name of the ECR repository"
  type        = string
}

variable "ecs_cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "ecs_cpu" {
  description = "CPU units for the ECS task"
  type        = string
}

variable "ecs_memory" {
  description = "Memory for the ECS task"
  type        = string
}

variable "ecs_container_name" {
  description = "Name of the ECS container"
  type        = string
}

variable "ecs_container_port" {
  description = "Port on which the ECS container listens"
  type        = number
}

variable "ecs_desired_count" {
  description = "Desired number of ECS tasks"
  type        = number
}

variable "ecs_security_group_ids" {
  description = "Security group IDs for ECS tasks"
  type        = list(string)
}

variable "nlb_name" {
  description = "Name of the Network Load Balancer"
  type        = string
}

variable "nlb_target_group_name" {
  description = "Name of the target group for the NLB"
  type        = string
}

variable "nlb_listener_port" {
  description = "Listener port for the NLB"
  type        = number
}

variable "privatelink_security_group_ids" {
  description = "Security group IDs for PrivateLink"
  type        = list(string)
}

variable "api_gateway_name" {
  description = "Name of the API Gateway"
  type        = string
}

variable "api_gateway_security_group_ids" {
  description = "Security group IDs for the API Gateway"
  type        = list(string)
}