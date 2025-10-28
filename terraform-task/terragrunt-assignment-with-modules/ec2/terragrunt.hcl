include {
  path = find_in_parent_folders()
}

terraform {
  source = "terraform-aws-modules/ec2-instance/aws"
}

dependency "vpc" {
  config_path = "../vpc"
}

dependency "iam" {
  config_path = "../iam"
}

inputs = {
  name          = var.project_name
  ami           = var.ami
  instance_type = var.instance_type

  subnet_id              = dependency.vpc.outputs.public_subnets[0]
  vpc_security_group_ids = [dependency.vpc.outputs.default_security_group_id]

}

