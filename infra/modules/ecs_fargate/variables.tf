variable "cluster_name" {
  description = "Name of the ECS cluster"
  type        = string
}

variable "cpu" {
  description = "CPU units for the task"
  type        = string
}

variable "memory" {
  description = "Memory (in MiB) for the task"
  type        = string
}

variable "container_name" {
  description = "Name of the container"
  type        = string
}

variable "ecr_repository_url" {
  description = "ECR repository URL for the container image"
  type        = string
}

variable "container_port" {
  description = "Port on which the container listens"
  type        = number
}

variable "desired_count" {
  description = "Number of desired ECS tasks"
  type        = number
}

variable "private_subnet_ids" {
  description = "List of private subnet IDs for ECS tasks"
  type        = list(string)
}

variable "target_group_arn" {
  description = "ARN of the target group for the load balancer"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the ECS Fargate tasks will run"
  type        = string
}

variable "aws_region" {
  description = "The AWS region to deploy resources in"
  type        = string
  default     = "us-east-1" # Replace with your desired default region
}