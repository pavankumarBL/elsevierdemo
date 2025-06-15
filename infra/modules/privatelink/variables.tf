variable "vpc_id" {
  description = "VPC ID where the VPC endpoint will be created"
  type        = string
}

variable "nlb_arns" {
  description = "List of Network Load Balancer ARNs for the VPC endpoint service"
  type        = list(string)
}

variable "subnet_ids" {
  description = "List of subnet IDs for the VPC endpoint"
  type        = list(string)
}

variable "name" {
  description = "The name to be used for resources"
  type        = string
}
