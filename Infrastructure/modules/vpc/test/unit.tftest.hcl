run "test-vpc-cdir" {
    
    variables {
      cidr_block = "10.0.0.0/16"
    }
    assert {
    condition     = aws_vpc.this.cidr_block == "10.0.0.0/16"
    error_message = "VPC CIDR block is incorrect"
  }
}