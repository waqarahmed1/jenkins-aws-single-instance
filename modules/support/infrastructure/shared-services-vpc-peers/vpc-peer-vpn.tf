module "shared-services-vpc-peer-vpn" {
  source = "../../../core/aws-vpc-peer"

  environment   = var.service_name
  service_name  = var.environment
  vpc_id        = data.terraform_remote_state.env_vpc.outputs.vpc_id
  peer_owner_id = var.peer_vpn_owner_id
  peer_vpc_id   = var.peer_vpn_vpc_id
}