# .tflint.hcl

config {
  format = "compact"      
  call_module_type = "all"
  force  = false        
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

# rule "aws_s3_bucket_logging_enabled" {
#  enabled = true
# }

# Organization-wide rule example
# rule "terraform_naming_convention" {
#  enabled = true
#  style   = "snake_case"
# }
