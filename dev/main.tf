# Development environment Terraform configuration
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
  key_name      = "Test-Ec2"
}