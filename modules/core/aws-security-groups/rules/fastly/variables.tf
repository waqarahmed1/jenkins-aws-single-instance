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

variable "fastly_api_key" {
  description = "Your fastly API key"
}

variable "security_group_id" {
  description = "The ID of the parent security group"
}

variable "type" {
  description = "Ingress or Egress rule?"
  default     = "ingress"
}

variable "from_port" {
  description = "Starting port number"
  default     = 443
}

variable "to_port" {
  description = "Ending port number"
  default     = 443
}

variable "protocol" {
  description = "TCP or UDP"
  default     = "tcp"
}

variable "description" {
  description = "Description of the rule (optional)"
  default     = ""
}
