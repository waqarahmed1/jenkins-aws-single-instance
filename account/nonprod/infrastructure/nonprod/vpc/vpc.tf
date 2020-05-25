module "shared_services_nonprod_vpc" {
  source = "../../../../../modules/support/infrastructure/shared-services-vpc"

  environment    = "nonprod"
  vpc_cidr_block = "172.1.0.0/25"
}