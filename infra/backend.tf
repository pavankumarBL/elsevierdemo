terraform {
  backend "s3" {
    bucket         = "elsevier-demo-state-bucket"
    key            = "elsevierdemo/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = false
  }
}