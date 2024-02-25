output "vpc_id" {
  description = "ID of the VPC"
  value       = module.network.vpc_id
}

output "public_subnets" {
  description = "ID of the Public Subnet"
  value       = module.network.public_subnets
}

output "private_subnets" {
  description = "ID of the Private Subnet"
  value       = module.network.private_subnets
}

output "public_subnets_cidr_blocks" {
  description = "cidr blocks of the Public Subnet"
  value       = module.network.public_subnets_cidr_blocks
}

output "private_subnets_cidr_blocks" {
  description = "cidr blocks of the Private Subnet"
  value       = module.network.private_subnets_cidr_blocks
}
