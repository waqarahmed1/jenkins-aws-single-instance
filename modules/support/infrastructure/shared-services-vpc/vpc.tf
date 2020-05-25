module "shared-services-vpc" {
  source = "../../../core/aws-vpc"

  service_name   = var.service_name
  vpc_cidr_block = var.vpc_cidr_block
  environment    = var.environment
}