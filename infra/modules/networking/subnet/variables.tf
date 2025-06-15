variable "vpc_id" {
  description = "The ID of the VPC where subnets will be created"
  type        = string
}

variable "vpc_cidr" {
  description = "The CIDR block of the VPC"
  type        = string
}

variable "azs" {
  description = "A list of availability zones for the subnets"
  type        = list(string)
}

variable "name" {
  description = "The name prefix for the subnets"
  type        = string
}

variable "create_public_subnets" {
  description = "Whether to create public subnets"
  type        = bool
  default     = true
}

variable "create_private_subnets" {
  description = "Whether to create private subnets"
  type        = bool
  default     = true
}