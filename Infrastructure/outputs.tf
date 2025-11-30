# Outputs for VPC and Subnets
###############################################
output "VPC-ID" {
  value = aws_vpc.main-aws_vpc.id
  description = "The ID of the VPC"
}

output "VPC-CIDR" {
  value = aws_vpc.main-aws_vpc.cidr_block
  description = "The CIDR block of the VPC"
}

output "VPC-NAME" {
  value = aws_vpc.main-aws_vpc.tags["Name"]
  description = "The Name tag of the VPC"
}

