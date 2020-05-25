
resource "aws_route" "vpn-route" {
  route_table_id            = data.terraform_remote_state.env_vpc.outputs.route_table_id
  destination_cidr_block    = var.peer_vpn_cidr
  vpc_peering_connection_id = module.shared-services-vpc-peer-vpn.peering_connection_id
}
