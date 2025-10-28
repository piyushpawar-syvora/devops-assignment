include {
  path = find_in_parent_folders()
}

terraform {
  source = "tfr:///terraform-aws-modules/s3-bucket/aws?version=6.5.0"
}

dependency "vpc" {
  config_path = "../vpc"
}

inputs = {
  bucket = "${var.project_name}-private-bucket"
  acl    = "private"

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

}