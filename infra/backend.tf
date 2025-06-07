terraform {
  backend "s3" {
    bucket         = "your-terraform-state-bucket"
    key            = "elsevierdemo/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
  }
}