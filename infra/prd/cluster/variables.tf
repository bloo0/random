variable "allowed_account_ids" {
  description = "List of allowed AWS account ids where resources can be created"
  type        = list(string)
  default     = []
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
