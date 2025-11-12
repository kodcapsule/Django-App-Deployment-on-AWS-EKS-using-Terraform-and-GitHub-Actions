
##############################################
# VPC Outputs
##############################################

output "VPC-ID" {
  value = aws_vpc.main-aws_vpc.id
  description = "The ID of the VPC"
}

output "VPC-CIDR" {
  value = aws_vpc.main-aws_vpc.cidr_block
  description = "The CIDR block of the VPC"
}

output "VPC-NAME" {
  value = aws_vpc.main-aws_vpc.name
  description = "The Name tag of the VPC"
}

##############################################
# Public Subnets
##############################################
output "PUBLIC-SUBNET-IDS" {
  description = "List of all public subnet IDs"
  value       = [for s in aws_subnet.public : s.id]
}

output "PUBLIC-SUBNET-CIDRS" {
  description = "CIDR blocks for public subnets"
  value       = [for s in aws_subnet.public : s.cidr_block]
}


##############################################
# Private Subnets
##############################################
output "PRIVATE-SUBNET-IDS" {
  description = "List of all private subnet IDs"
  value       = [for s in aws_subnet.private : s.id]
}

output "PRIVATE-SUBNET-CIDRS" {
  description = "CIDR blocks for private subnets"
  value       = [for s in aws_subnet.private : s.cidr_block]
}

##############################################
# Internet Gateway
##############################################
output "INTERNET-GATEWAY-ID" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.igw.id
}

##############################################
# NAT Gateways
##############################################
output "NAT-GATEWAY-IDS" {
  description = "List of all NAT Gateway IDs"
  value       = [for nat in aws_nat_gateway.nat : nat.id]
}

output "NAT-EIP-ALLOCATIONS" {
  description = "Elastic IPs allocated for NAT Gateways"
  value       = [for eip in aws_eip.nat : eip.public_ip]
}

##############################################
# Route Tables
##############################################
output "PUBLIC-ROUTE-TABLE-ID" {
  description = "Route Table ID for the public subnets"
  value       = aws_route_table.public.id
}

output "PRIVATE-ROUTE-TABLE-IDS" {
  description = "Route Table IDs for each private subnet"
  value       = [for rt in aws_route_table.private : rt.id]
}