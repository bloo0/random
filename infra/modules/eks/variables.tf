variable "name" {
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

variable "cluster_name" {
  type    = string
}

variable "cluster_version" {
  type    = string
}

variable "cluster_endpoint_public_access" {
  type    = bool
}

variable "vpc_id" {
  type    = string
}

variable "subnet_ids" {
  description = "A list of subnets inside the VPC"
  type        = list(string)
  default     = []
}

variable "control_plane_subnet_ids" {
  description = "A list of control plane subnets inside the VPC"
  type        = list(string)
  default     = []
}