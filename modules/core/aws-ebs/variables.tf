

variable "asg_az" {
  description = "Availability zone for ASG"
  default  =  "eu-west-1b"
}

variable "ebs_name" {
  description = "EBS name tag value"
  type        = string
}

variable "application" {
  description = "EBS application tag value"
  type        = string
}

variable "size" {
}

variable "encrypted" {
}

variable "iops" {
}

variable "type" {
}

variable "environment" {
}


