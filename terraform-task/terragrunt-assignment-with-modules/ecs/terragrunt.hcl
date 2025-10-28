include {
  path = find_in_parent_folders()
}

terraform {
  source = "terraform-aws-modules/ecs/aws"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  cluster_name       = "tf-assignment-ecs-dev"
  container_insights = true
}