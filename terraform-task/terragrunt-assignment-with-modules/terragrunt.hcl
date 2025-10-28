remote_state {
  backend = "s3"

  generate = {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  }

  config = {
    bucket         = "terraform-project-private-bucket-b520f09a"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "terraform-locks"
  }
}

generate "provider" {
  path      = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents  = <<EOF
provider "aws" {
  region = "eu-north-1"
}
EOF
}

