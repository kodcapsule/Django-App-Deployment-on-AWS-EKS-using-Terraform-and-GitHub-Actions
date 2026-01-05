# # use the vpc module to create a VPC
# module "vpc" {
#   source = "./modules/vpc"
#   VPC-CIDR-BLOCK = var.VPC-CIDR-BLOCK
#   VPC-NAME       = var.VPC-NAME
#   REGION         = var.REGION
#   PUBLIC-SUBNETS  = var.PUBLIC-SUBNETS
#   PRIVATE-SUBNETS = var.PRIVATE-SUBNETS

#   TAGS = var.TAGS
# }