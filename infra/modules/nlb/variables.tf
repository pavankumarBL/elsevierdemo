variable "nlb_name" {
  description = "Name of the Network Load Balancer"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the NLB"
  type        = list(string)
}

variable "vpc_id" {
  description = "VPC ID for the NLB"
  type        = string
}

variable "target_group_name" {
  description = "Name of the target group"
  type        = string
}

variable "target_port" {
  description = "Port for the target group"
  type        = number
}

variable "listener_port" {
  description = "Port for the NLB listener"
  type        = number
}