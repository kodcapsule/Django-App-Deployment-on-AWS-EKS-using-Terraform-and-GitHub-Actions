package terraform.helpers

# Combine all denies from subpackages
deny[msg] {
  msg := data.terraform.s3.deny[_]
} {
  msg := data.terraform.iam.deny[_]
} {
  msg := data.terraform.network.deny[_]
}
