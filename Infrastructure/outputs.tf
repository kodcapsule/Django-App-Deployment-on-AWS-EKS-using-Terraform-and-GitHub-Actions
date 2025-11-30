# Outputs for VPC and Subnets
###############################################
output "VPC-ID" {
  value = module.vpc.VPC-ID
  description = "The ID of the VPC"
}

output "VPC-CIDR" {
  value = module.vpc.VPC-CIDR
  description = "The CIDR block of the VPC"
}

output "VPC-NAME" {
  value = module.vpc.VPC-NAME
  description = "The Name tag of the VPC"
}

