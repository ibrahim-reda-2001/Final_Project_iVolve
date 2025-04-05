terraform {
  backend "s3" {
    bucket         = "ibra-terraform-s3"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source          = "./modules/network"
  vpc-cidr        = var.vpc_cidr
  public-subnet-cidr = var.public_subnet_cidr
  az             = var.az
}

module "compute" {
  source        = "./modules/compute"
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  subnet_id     = module.network.public_subnet_id
  vpc_id        = module.network.vpc_id
  instance_count = var.instance_count
  instance_name=["jenkins", "jenkins-slave"]

}

output "public_ips" {
  value = module.compute.instance_public_ips
}
