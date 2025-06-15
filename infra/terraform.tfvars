aws_region                   = "us-east-1"
azs                          = ["us-east-1a", "us-east-1b"]

ecr_repository_name          = "elsevier-demo-ecr-repo"

ecs_cluster_name             = "elsevier-demo-ecs-cluster"
ecs_cpu                      = "256"
ecs_memory                   = "512"
ecs_container_name           = "elsevier-demo-app"
ecs_container_port           = 8080
ecs_desired_count            = 2
nlb_name                     = "elsevier-demo-nlb"
nlb_target_group_name        = "elsevier-demo-nlb-tg"
nlb_listener_port            = 8080
privatelink_name             = "elsevier-demo-pvlink"
api_gateway_name             = "elsevier-demo-apigateway"
