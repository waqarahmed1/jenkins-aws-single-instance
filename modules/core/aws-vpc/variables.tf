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

variable "vpc_cidr_block" {
  description = "VPC Cidr Block. This is related to the vpc_subnet_bitmask variable."
}

variable "az_limit" {
  description = "A limit of availability zones to deploy to."
  default     = 2
}




