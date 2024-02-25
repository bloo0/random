variable "allowed_account_ids" {
  description = "List of allowed AWS account ids where resources can be created"
  type        = list(string)
  default     = []
}

variable "aws_region" {
  type    = string
  default = "ap-southeast-1"
}

# APP
variable "app_hello" {
  type    = string
  default = "hello"
}

variable "app_welcome" {
  type    = string
  default = "welcome"
}

# ECR
variable "isMutable" {
  type    = string
  default = "IMMUTABLE"
}

variable "repo_type" {
  type    = string
  default = "private"
}
