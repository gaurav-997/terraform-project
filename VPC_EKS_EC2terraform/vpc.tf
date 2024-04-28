provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key

}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "5.8.0"

  name = "gaurav-vpc-eks"
  cidr = var.vpc_cidr

  azs                  = ["us-east-1"]
  private_subnets      = ["10.0.1.0/24"]
  public_subnets       = ["10.0.2.0/24"]
  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = {
    name = "gaurav-vpc"
  }
}

output "subnet_id" {
  value = module.vpc.private_subnets

}