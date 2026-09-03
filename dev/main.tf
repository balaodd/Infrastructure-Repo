# Development environment Terraform configuration
terraform {
  backend "s3" {
    bucket = "my-terraform-state-2026-122798937636-ap-south-1-an"
    key    = "dev/terraform.tfstate"
    region = "ap-south-1"
  }
}
module "vpc" {
  source = "../modules/vpc"

  vpc_cidr = var.vpc_cidr
}
module "ec2" {

  source = "../modules/ec2"

  ami_id        = var.ami_id
  instance_type = var.instance_type
  subnet_id     = module.vpc.public_subnet_id
  instance_name = var.instance_name
  key_name      = var.key_name
}