variable "cluster_name" {}
variable "app_name" {}
variable "container_port" {}
variable "vpc_id" {}
variable "public_subnets" {
  type = list(string)
}
variable "alb_target_group" {}
variable "execution_role_arn" {}
variable "ecr_repo_url" {}