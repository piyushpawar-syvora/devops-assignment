include {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/vpc/aws?version=6.5.0"
}


inputs = {
  name = var.project_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.public_subnet_cidr
  public_subnets  = var.private_subnet_cidr

  enable_nat_gateway   = true
  single_nat_gateway   = true
  enable_dns_hostnames = true

  tags = { Environment = "dev" }
}

