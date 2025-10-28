module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = var.project_name
  cidr = var.vpc_cidr

  azs             = var.azs
  private_subnets = var.public_subnet_cidr
  public_subnets  = var.private_subnet_cidr

  enable_nat_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}

module "s3_bucket" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket = "my-s3-bucket"
  acl    = "private"

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  versioning = {
    enabled = true
  }
}

module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"
  name = var.project_name

  instance_type = var.instance_type
  key_name      = "user1"
  monitoring    = true
  subnet_id     = module.network.private_subnet_id

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "iam_policy" {
  source  = "terraform-aws-modules/iam/aws//modules/iam-policy"

  name        = "${var.project_name}-s3-policy"
  description = "Policy for my application's S3 access"

  policy = jsonencode(
    {
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = ["s3:ListBucket"]
        Resource = ["arn:aws:s3:::${var.s3_bucket_name}"]
      },
      {
        Effect = "Allow"
        Action = ["s3:GetObject", "s3:PutObject", "s3:DeleteObject"]
        Resource = ["arn:aws:s3:::${var.s3_bucket_name}/*"]
      }
    ]
  })
  

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

module "iam_role" {
  source  = "terraform-aws-modules/iam/aws"

  create_role = true
  role_name   = "tf-ec2-s3-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}

module "my_security_group" {
  source = "terraform-aws-modules/security-group/aws"
  version = "5.3.1"

  name        = "my-app-sg"
  description = "Security group f"
  vpc_id      = var.vpc_id

  ingress_rules = ["http-80-tcp", "https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"] \

  egress_rules = ["all-all"]
}

module "ecr" {
  source  = "terraform-aws-modules/ecr/aws"
  version = "3.1.0"
}
module "ecs" {
  source  = "terraform-aws-modules/ecs/aws"
  version = "6.7.0"
}