include {
  path = find_in_parent_folders()
}

terraform {
  source = "terraform-aws-modules/iam/aws"
}

inputs = {
  create_role = true
  role_name   = "ec2-s3-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = { Service = "ec2.amazonaws.com" }
      Action    = "sts:AssumeRole"
    }]
  })
}