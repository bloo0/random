provider "aws" {
  region  = "${var.aws_region}"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
}

module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "~> 3.0"

  name = var.name

  cidr = var.cidr

  public_subnets = var.public_subnets
  private_subnets = var.private_subnets

}
