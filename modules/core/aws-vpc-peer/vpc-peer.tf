##################################################################################################################
#                                                                                                                #
# aws_internet_gate: Provides a resource to create a VPC Peer.                                       #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/internet_gateway.html                           #
#                                                                                                                #
##################################################################################################################

resource "aws_vpc_peering_connection" "peer" {
  vpc_id        = var.vpc_id
  peer_vpc_id   = var.peer_vpc_id
  peer_owner_id = var.peer_owner_id
  //peer_region   = var.aws_region
  auto_accept = false

  /*  requester {
      allow_remote_vpc_dns_resolution = true
  }*/

  tags = {
    Side = "Requester"
  }

}


