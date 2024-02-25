provider "aws" {
  region  = "${var.aws_region}"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
}

terraform {
  backend "s3" {
    bucket         = "random-devops-tf"
    key            = "resource/prd/vpc/terraform.tfstate"
    region         = "ap-southeast-1"
    role_arn       = "arn:aws:iam::AWS_ACCOUNT_ID:role/random-tf-role"
  }
}

module "network" {
  source = "../modules/network"

  name = var.name

  cidr = var.cidr
  azs  = var.azs
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
}
