aws_region = "us-east-1"

vpc_name   = "prod-vpc"
vpc_cidr   = "10.1.0.0/16"
azs        = ["us-east-1a", "us-east-1b"]

ecr_repository_name = "prod-ecr-repo"

ecs_cluster_name     = "prod-ecs-cluster"
ecs_cpu              = "512"
ecs_memory           = "1024"
ecs_container_name   = "prod-app"
ecs_container_port   = 8080
ecs_desired_count    = 4

nlb_name               = "prod-nlb"
nlb_target_group_name  = "prod-nlb-tg"
nlb_listener_port      = 8080

api_gateway_name       = "prod-api-gateway"