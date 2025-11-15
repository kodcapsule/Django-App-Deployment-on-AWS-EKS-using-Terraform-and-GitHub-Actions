package terraform.helpers

# Combine all denies from subpackages
# Use 'contains' and 'if' for each condition.

deny contains msg if {
  msg := data.terraform.s3.deny[_]
}

deny contains msg if {
  msg := data.terraform.iam.deny[_]
}

deny contains msg if {
  msg := data.terraform.network.deny[_]
}
