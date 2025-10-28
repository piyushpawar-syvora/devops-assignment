terramate {
  required_version = ">= 0.4.0"
}

globals "aws" {
  region = "ap-south-1"
}

# Default backend and provider template
generate_hcl "_provider.tf" {
  content = <<-EOF
    terraform {
      backend "s3" {
        bucket         = "terraform-state-bucket"
        key            = "${terramate.stack.path_relative_to_root}/terraform.tfstate"
        region         = "ap-south-1"
        encrypt        = true
        dynamodb_table = "terraform-locks"
      }
    }

    provider "aws" {
      region = global.aws.region
    }
  EOF
}
