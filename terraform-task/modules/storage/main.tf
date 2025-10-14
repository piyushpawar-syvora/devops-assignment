resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "private_bucket" {
  bucket = "${var.project_name}-private-bucket-${random_id.bucket_suffix.hex}"
  force_destroy = false
  tags = { Name = "${var.project_name}-s3" }
}

