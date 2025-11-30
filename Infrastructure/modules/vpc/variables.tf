# variable "VPC-CIDR-BLOCK" {
#   description = " default VPC CIDR block"
#   type = string
#   default = "10.0.0.0/16"
# }

# variable "VPC-NAME" {
#   description = "Name tag for the VPC"
#   type = string
#   default = "main-vpc"
# }

# variable "REGION" {
#   description = "Default region for the VPC"
#   type = string
#   default = "us-east-1"
# }


# ##############################################
# # Public Subnets
# ##############################################
# variable "PUBLIC-SUBNETS" {
#   description = "Map of AZ to public subnet CIDR blocks"
#   type = map(string)
#   default = {
#     "us-east-1a" = "10.0.0.0/24"
#     "us-east-1b" = "10.0.1.0/24"
#     "us-east-1c" = "10.0.2.0/24"
#   }
# }

# ##############################################
# # Private Subnets
# ##############################################
# variable "PRIVATE-SUBNETS" {
#   description = "Map of AZ to private subnet CIDR blocks"
#   type = map(string)
#   default = {
#     "us-east-1a" = "10.0.10.0/22"
#     "us-east-1b" = "10.0.14.0/22"
#     "us-east-1c" = "10.0.18.0/22"
#   }
# }

# ##############################################
# # Tags
# ##############################################
# variable "TAGS" {
#   description = "Default tags to apply to all resources"
#   type        = map(string)
#   default = {
#     Project = "KodeCapsule"
#     Env     = "Dev"
#     Managed = "Terraform"
#   }
# }