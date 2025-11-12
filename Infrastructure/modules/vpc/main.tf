


locals {
  public_subnets = {
    "us-east-1a" = "10.0.0.0/24"
    "us-east-1b" = "10.0.1.0/24"
    "us-east-1c" = "10.0.2.0/24"
  }

  private_subnets = {
    "us-east-1a" = "10.0.10.0/22"
    "us-east-1b" = "10.0.14.0/22"
    "us-east-1c" = "10.0.18.0/22"
  }
}

##############################################
# VPC
##############################################

resource "aws_vpc" "main-aws_vpc" {
  cidr_block = var.VPC-CIDR-BLOCK
  enable_dns_hostnames = true
  enable_dns_support   = true
  region = var.REGION
    tags = {
        Name = var.VPC-NAME
    }
}


##############################################
# Internet Gateway
##############################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-aws_vpc.id
  tags = {
    Name = var.VPC-NAME
  }
}


##############################################
# Public Subnets (/24)
##############################################


resource "aws_subnet" "public" {
  for_each = local.public_subnets

  vpc_id                  = aws_vpc.main-aws_vpc.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${each.key}"
    Tier = "public"
  }
}


##############################################
# Private Subnets (/22)
##############################################
resource "aws_subnet" "private" {
  for_each = local.private_subnets

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name = "private-${each.key}"
    Tier = "private"
  }
}