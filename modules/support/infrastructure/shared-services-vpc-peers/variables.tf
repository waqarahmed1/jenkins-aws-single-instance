variable "aws_region" {
  default = "eu-west-1"
}

variable "service_name" {
  description = "Name of project or service that this VPC infrastructure relates to."
  default     = "shared-services"
}

variable "environment" {
  description = "Environment name"
}

variable "peer_vpn_vpc_id" {
  description = "VPC Id for accepting side"
}

variable "peer_vpn_owner_id" {
  description = "AWS Account Id for accepting side"
}