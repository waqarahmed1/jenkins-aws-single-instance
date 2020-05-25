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

variable "environment" {
  description = "Environment name"
}

variable "service_name" {
  description = "Name of project or service that this VPC infrastructure relates to."
}

variable "peer_vpc_id" {
  description = "VPC Id for accepting side"
}

variable "peer_owner_id" {
  description = "AWS Account Id for accepting side"
}

variable "vpc_id" {
  description = "VPC Id for accepting side"
}




