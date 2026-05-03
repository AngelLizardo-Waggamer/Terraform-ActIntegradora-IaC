terraform {
  backend "s3" {
    bucket         = "iac-infra-tfstate-bucket"
    key            = "infra/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "iac-infra-tfstate-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = var.aws_region
}

data "aws_availability_zones" "available" {
  state = "available"
}

module "vpc" {
  source               = "./modules/vpc"
  name                 = var.project_name
  cidr                 = var.vpc_cidr
  azs                  = slice(data.aws_availability_zones.available.names, 0, 2)
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "alb" {
  source            = "./modules/alb"
  name              = var.project_name
  vpc_id            = module.vpc.vpc_id
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "eks" {
  source             = "./modules/eks"
  name               = var.project_name
  cluster_version    = var.eks_version
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
}

module "rds" {
  source             = "./modules/rds"
  name               = var.project_name
  vpc_id             = module.vpc.vpc_id
  private_subnet_ids = module.vpc.private_subnet_ids
  db_name            = var.db_name
  db_username        = var.db_username
  db_password        = var.db_password
  instance_class     = var.db_instance_class
}

module "s3" {
  source      = "./modules/s3"
  bucket_name = var.s3_bucket_name
}
