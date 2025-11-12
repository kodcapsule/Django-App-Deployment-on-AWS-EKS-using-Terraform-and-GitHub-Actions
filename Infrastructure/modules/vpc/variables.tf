variable "VPC-CIDR-BLOCK" {
  description = " default VPC CIDR block"
  type = string
  default = "10.0.0.0/16"
}

variable "VPC-NAME" {
  description = "Name tag for the VPC"
  type = string
  default = "main-vpc"
}

variable "REGION" {
  description = "Default region for the VPC"
  type = string
  default = "us-east-1"
}