##################################################################################################################
#                                                                                                                #
# Variables define the parameterization of Terraform configurations. Variables can be overridden via the CLI.    #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/variables.html                                    #
#                                                                                                                #
##################################################################################################################

variable "aws_region" {
  description = "AWS region name"
  default     = "eu-west-1"
}

variable "peer_vpn_owner_id" {
}

variable "peer_vpn_vpc_id" {
}

variable "peer_vpn_cidr" {
}

variable "peer_nonprod_owner_id" {
}

variable "peer_nonprod_vpc_id" {
}

variable "peer_nonprod_cidr" {
}

