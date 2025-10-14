module "network" {

  source = "./modules/network"

  project_name      = var.project_name
  vpc_cidr                = var.vpc_cidr
  public_subnet_cidr    = var.public_subnet_cidr
  private_subnet_cidr   = var.private_subnet_cidr
}

module "storage" {
  source       = "./modules/storage"
  project_name = var.project_name
}

module "compute" {
  source            = "./modules/compute"
  project_name      = var.project_name
  subnet_id         = module.network.private_subnet_id
  public_subnet_id  = module.network.public_subnet_id
  vpc_id            = module.network.vpc_id
  s3_bucket_name    = module.storage.s3_bucket_name
  instance_type     = var.instance_type
  ami_filter_name   = var.ami_filter_name
}


module "containers" {
  source       = "./modules/containers"
  project_name = var.project_name
}