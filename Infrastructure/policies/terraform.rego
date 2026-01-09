package terraform

import rego.v1

# Default deny
default allow := false

# Allow if no violations
allow if {
    count(deny) == 0
}

# Collect all denial reasons
deny contains msg if {
    some resource in input.resource_changes
    resource.type == "aws_s3_bucket"
    some v in resource.change.after.versioning
    not v.enabled
    msg := sprintf("S3 bucket '%s' must have versioning enabled", [resource.address])
}

deny contains msg if {
    some resource in input.resource_changes
    resource.type == "aws_instance"
    resource.change.after.instance_type == "t3.large"
    msg := sprintf("Instance '%s' cannot use t3.large type", [resource.address])
}