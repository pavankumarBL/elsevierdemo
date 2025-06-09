aws_region                   = "us-east-1"

vpc_name                     = "demo-vpc"
vpc_cidr                     = "10.0.0.0/16"
azs                          = ["us-east-1a", "us-east-1b"]

ecr_repository_name          = "demo-ecr-repo"

ecs_cluster_name             = "demo-ecs-cluster"
ecs_cpu                      = "256"
ecs_memory                   = "512"
ecs_container_name           = "demo-app"
ecs_container_port           = 8080
ecs_desired_count            = 2
ecs_security_group_ids       = ["sg-xxxxxxxxxxxxxxxxx"]

nlb_name                     = "demo-nlb"
nlb_target_group_name        = "demo-nlb-tg"
nlb_listener_port            = 8080

privatelink_security_group_ids = ["sg-xxxxxxxxxxxxxxxxx"]

api_gateway_name             = "demo-apigateway"
api_gateway_security_group_ids = ["sg-xxxxxxxxxxxxxxxxx"]