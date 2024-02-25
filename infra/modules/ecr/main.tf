provider "aws" {
  region  = "${var.aws_region}"
  skip_credentials_validation = true
  skip_requesting_account_id  = true
  skip_metadata_api_check     = true
  skip_region_validation      = true
}

module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  repository_name = var.repository_name
  repository_type = var.repository_type
  repository_image_tag_mutability = var.repository_image_tag_mutability


  tags = {
    Terraform   = "true"
    Environment = var.env
  }
}
