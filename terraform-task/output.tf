output "vpc_id" {
  value = module.network.vpc_id
}

output "public_subnet_id" {
  value = module.network.public_subnet_id
}

output "private_subnet_id" {
  value = module.network.private_subnet_id
}

output "s3_bucket_name" {
  value = module.storage.s3_bucket_name
}

output "ec2_instance_id" {
  value = module.compute.instance_id
}

output "ec2_public_ip" {
  value = module.compute.instance_public_ip
}

output "ecr_repository_url" {
  value = module.containers.ecr_repository_url
}

output "ecs_cluster_name" {
  value = module.containers.ecs_cluster_name
}

