variable "repository_name" {
  description = "Name to be used on all the resources as identifier"
  type        = string
  default     = ""
}

variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

variable "env" {
  type    = string
}

variable "repository_image_tag_mutability" {
  type    = string
}

variable "repository_type" {
  type    = string
}
