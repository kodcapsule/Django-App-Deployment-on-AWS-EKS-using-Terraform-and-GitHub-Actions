# .tflint.hcl

config {
  format = "compact"      # CLI output format (options: default, compact, json)
  module = true           # Analyze nested modules
  force  = false         # Optional: skip confirmation prompts
}

plugin "aws" {
    enabled = true
    version = "0.43.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# Example: AWS-specific rules
rule "aws_instance_invalid_type" {
  enabled = true
}

rule "aws_s3_bucket_logging_enabled" {
  enabled = true
}

# Organization-wide rule example
rule "terraform_naming_convention" {
  enabled = true
  style   = "snake_case"
}
