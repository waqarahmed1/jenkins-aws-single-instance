##################################################################################################################
#                                                                                                                #
# Variables define the parameterization of Terraform configurations. Variables can be overridden via the CLI.    #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/configuration/variables.html                                    #
#                                                                                                                #
##################################################################################################################

variable "aws_region" {
  description = "AWS region name"
}

variable "account" {
  description = "The account e.g. development or production"
  default     = ""
}

variable "environment" {
  description = "The environment e.g. sit, preprod, production"
  default     = ""
}

variable "security_group_name" {
  description = "The name of the security group"
}

variable "security_group_description" {
  description = "The description of the security group"
}

variable "vpc_id" {
  description = "The ID of the VPC"
}

