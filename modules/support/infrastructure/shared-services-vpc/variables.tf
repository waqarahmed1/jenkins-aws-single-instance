variable "aws_region" {
  default = "eu-west-1"
}

variable "service_name" {
  description = "Name of project or service that this VPC infrastructure relates to."
  default     = "shared-services"
}

variable "vpc_cidr_block" {
  description = "The CIDR block which has been allocated to this VPC"
}

variable "environment" {
  description = "Environment name"
}