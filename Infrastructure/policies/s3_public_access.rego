package terraform.s3

# Deny any S3 bucket that is public
deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket"
  acl := resource.change.after.acl
  acl == "public-read" or acl == "public-read-write"
  msg := sprintf("❌ S3 bucket %s has public ACL (%s)", [resource.address, acl])
}

# Deny if block_public_acls or block_public_policy disabled
deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket_public_access_block"
  not resource.change.after.block_public_acls
  msg := sprintf("❌ S3 bucket public ACLs not blocked: %s", [resource.address])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_s3_bucket_public_access_block"
  not resource.change.after.block_public_policy
  msg := sprintf("❌ S3 bucket public policies not blocked: %s", [resource.address])
}
