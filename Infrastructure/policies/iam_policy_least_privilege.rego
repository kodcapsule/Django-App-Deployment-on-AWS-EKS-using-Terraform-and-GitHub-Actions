package terraform.iam

# Deny any inline or managed IAM policy granting full admin access
deny[msg] {
  resource := input.resource_changes[_]
  startswith(resource.type, "aws_iam_policy")
  statement := resource.change.after.policy.Statement[_]
  effect := statement.Effect
  actions := statement.Action[_]
  effect == "Allow"
  actions == "*"
  msg := sprintf("❌ IAM Policy %s grants admin (*:*). Review permissions.", [resource.address])
}

deny[msg] {
  resource := input.resource_changes[_]
  resource.type == "aws_iam_role_policy_attachment"
  contains(resource.change.after.policy_arn, "AdministratorAccess")
  msg := sprintf("❌ Role %s attached to AdministratorAccess policy", [resource.address])
}
