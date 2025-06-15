aws_region = "us-east-1"

vpc_name = "dev-vpc"
vpc_cidr = "10.0.0.0/16"
azs      = ["us-east-1a", "us-east-1b"]

ecr_repository_name = "dev-ecr-repo"

ecs_cluster_name   = "dev-ecs-cluster"
ecs_cpu            = "256"
ecs_memory         = "512"
ecs_container_name = "dev-app"
ecs_container_port = 8080
ecs_desired_count  = 2

nlb_name              = "dev-nlb"
nlb_target_group_name = "dev-nlb-tg"
nlb_listener_port     = 8080

api_gateway_name = "dev-api-gateway"