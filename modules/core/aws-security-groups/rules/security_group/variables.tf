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

variable "security_group_id" {
  description = "The ID of the parent security group"
}

variable "type" {
  description = "Ingress or Egress rule?"
}

variable "from_port" {
  description = "Starting port number"
}

variable "to_port" {
  description = "Ending port number"
}

variable "protocol" {
  description = "TCP or UDP"
}

variable "source_security_group_id" {
  description = "The source security group id"
}

variable "description" {
  description = "Description of the rule (optional)"
  default     = ""
}

