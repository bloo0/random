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
    key            = "resource/prd/resources/terraform.tfstate"
    region         = "ap-southeast-1"
    role_arn       = "arn:aws:iam::AWS_ACCOUNT_ID:role/random-tf-role"
  }
}

module "ecr_hello"  {
  source = "../modules/ecr"

  repository_name = var.app_hello
  repository_image_tag_mutability = var.isMutable
  repository_type = var.repo_type
}

module "ecr_welcome"  {
  source = "../modules/ecr"

  repository_name = var.app_welcome
  repository_image_tag_mutability = var.isMutable
  repository_type = var.repo_type
}
