package terraform.network

# Deny EC2 instances or NICs with public IPs
deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_instance"
  resource.change.after.associate_public_ip_address == true
  msg := sprintf("❌ EC2 instance %s has public IP association", [resource.address])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_network_interface"
  resource.change.after.associate_public_ip_address == true
  msg := sprintf("❌ Network interface %s has public IP association", [resource.address])
}

# Deny public subnets (0.0.0.0/0 route)
deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_route"
  resource.change.after.cidr_block == "0.0.0.0/0"
  msg := sprintf("❌ Route %s exposes subnet publicly (0.0.0.0/0)", [resource.address])
}
