variable "aws_region" {
  description = "AWS region"
  type        = string
  default     = "eu-north-1"
}

variable "instance_ami" {
  default = "ami-0c2b8ca1dad447f8a"
}

variable "project_name" {
  type    = string
  default = "terraform-project"
}

variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "ami_filter_name" {
  type    = string
  default = "amzn2-ami-hvm-*-x86_64-gp2"
}
