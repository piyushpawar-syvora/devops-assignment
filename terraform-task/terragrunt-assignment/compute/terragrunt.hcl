include {
  path = find_in_parent_folders()
}

terraform {
  source = "../../modules/compute"
}

inputs = {
  subnet_id = "10.0.1.0/24"
  public_subnet_id = "10.0.1.0/24"
  s3_bucket_name = "my-bucket"
  instance_type = "t3.micro"
  ami_filter_name = "amzn2-ami-hvm-*-x86_64-gp2"
  vpc_id  = "vpc-0123456789abcdef0"
}