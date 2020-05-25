module "shared_services_nonprod_vpc" {
  source = "../../../../../modules/support/infrastructure/shared-services-vpc-peers"

  environment = "nonprod"

  peer_vpn_owner_id = var.peer_vpn_owner_id
  peer_vpn_vpc_id   = var.peer_vpn_vpc_id
  peer_vpn_cidr     = var.peer_vpn_cidr

}