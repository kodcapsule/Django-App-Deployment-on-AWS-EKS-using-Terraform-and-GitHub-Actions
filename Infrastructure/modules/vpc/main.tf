


##############################################
#                 VPC
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
#           Internet Gateway
##############################################
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main-aws_vpc.id
  tags = {
    Name = var.VPC-NAME
  }
}


##############################################
#               Public Subnets (/24)
##############################################


resource "aws_subnet" "public" {
  for_each = var.PUBLIC-SUBNETS

  vpc_id                  = aws_vpc.main-aws_vpc.id
  cidr_block              = each.value
  availability_zone       = each.key
  map_public_ip_on_launch = true

  tags = {
    Name = "public-${each.key}"
    
  }
}


##############################################
#          Private Subnets (/22)
##############################################
resource "aws_subnet" "private" {
  for_each = var.PRIVATE-SUBNETS

  vpc_id            = aws_vpc.main.id
  cidr_block        = each.value
  availability_zone = each.key

  tags = {
    Name = "private-${each.key}"    
  }
}

##############################################
#       Elastic IPs for NAT Gateways
##############################################
resource "aws_eip" "nat" {
  for_each = var.PUBLIC-SUBNETS

  domain = "vpc"
  tags = {
    Name = "nat-eip-${each.key}"
  }
}

##############################################
#             NAT Gateways
##############################################
resource "aws_nat_gateway" "nat" {
  for_each = var.PUBLIC-SUBNETS

  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.key].id

  tags = {
    Name = "nat-gateway-${each.key}"
  }

  depends_on = [aws_internet_gateway.igw]
}

##############################################
#             Route Tables
##############################################
# Public Route Table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "public-rt"
  }
}

resource "aws_route" "public_internet_access" {
  route_table_id         = aws_route_table.public.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# Associate Public Subnets
resource "aws_route_table_association" "public_assoc" {
  for_each = aws_subnet.public
  subnet_id      = each.value.id
  route_table_id = aws_route_table.public.id
}

###############################################
# Private Route Tables
##############################################
resource "aws_route_table" "private" {
  for_each = var.PRIVATE-SUBNETS

  vpc_id = aws_vpc.main-aws_vpc.id
  tags = {
    Name = "private-rt-${each.key}"
  }
}

resource "aws_route" "private_nat_route" {
  for_each = aws_route_table.private

  route_table_id         = each.value.id
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = aws_nat_gateway.nat[each.key].id
}

#   Associate Private Subnets  
resource "aws_route_table_association" "private_assoc" {
  for_each = aws_subnet.private

  subnet_id      = each.value.id
  route_table_id = aws_route_table.private[each.key].id
}
