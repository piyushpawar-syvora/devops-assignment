include {
  path = find_in_parent_folders()
}

terraform {
  source = "terraform-aws-modules/ecr/aws"
}

inputs = {
  repository_name = "tf-assignment-repo-dev"

  tags = { Environment = "dev" }
}