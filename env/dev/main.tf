terraform {
  backend "s3" {
    bucket         = "infraforge-tf-state-veerendra"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
  }
}

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "../../modules/vpc"
}

module "ec2" {
  source         = "../../modules/ec2"
  subnet_id      = module.vpc.subnet_id
  instance_type  = var.instance_type
  sg_id          = module.sg.sg_id
}

module "sg" {
  source = "../../modules/security-group"
  vpc_id = module.vpc.vpc_id
}