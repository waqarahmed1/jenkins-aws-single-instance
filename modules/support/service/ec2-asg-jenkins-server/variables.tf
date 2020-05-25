variable "aws_region" {
  description = "The region we're deploying to"
}

variable "name" {
  description = "name"
}

variable "account" {
  description = "Account name - dev or prod"
}

variable "environment" {
  description = "Environment name - pre-prod or prod"
}

variable "tags" {
  type = map(string)
}

variable "keypair" {
  description = "Name of the key in AWS"
}

variable "lb_listener_port" {
  description = "Port that the Load Balancer listens on for incoming traffic."
  type        = number
  default     = 80
}

variable "lb_listener_protocol" {
  description = "Traffic Protocol that LB listens on. Valid values are: HTTP, HTTPS, TCP, or SSL"
  type        = string
  default     = "HTTP"
}

variable "service_name" {
}

variable "instance_listener_port" {
  description = "Port that the instances will recive incoming service traffic on"
  type        = number
}

variable "instance_listener_protocol" {
  description = "Traffic Protocol that instance listens on. Valid values are: HTTP, HTTPS, TCP, or SSL"
  type        = string
  default     = "HTTP"
}

variable "lb_health_check_path" {
  description = "Path to check health of instances.  Must start with a forward slash."
  type        = string
}

variable "lb_health_check_port" {
  description = "Port to check health of instances."
  type        = number
}

variable "ssl_certificate_arn" {
  description = "SSL certifcate to use for ALB."
  type        = string
}

variable "alb_dns" {
  description = "If the ALB should have a DNS"
  type        = number
}

variable "internal_domain" {
  description = "Internal domain to use for Route53"
  type        = string
}

variable "domain_name" {
  description = "Domain name for ALB"
  type        = string
}

variable "application" {
  description = "Application name in ebs volume tag"
  type        = string
}

variable "ebs_name" {
  description = "EBS name tag value"
  type        = string
}
