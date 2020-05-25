variable "aws_region" {
  type = string
}

variable "environment" {
  description = "Environment that this is being deployed to."
}

variable "alb_backend_port" {
  type        = string
  description = "the port the EC2 instance listens on"
}

variable "alb_backend_protocol" {
  type        = string
  description = "the protocol in use by the service the ALB is connecting to, HTTP or HTTPS"
}

variable "alb_cookie_duration" {
  type        = string
  description = "The range is 1 second to 1 week (604800 seconds), default is 1 day"
  default     = "86400"
}

variable "alb_deregistration_delay" {
  type = string
}

variable "alb_enable_logging" {
  default = false
}

variable "alb_health_check_healthy_threshold" {
  description = "Number of consecutive positive health checks before a backend instance is considered healthy."
  default     = 2
}

variable "alb_health_check_interval" {
  description = "The approximate amount of time, in seconds, between health checks of an individual target. The range is 5 to 300 seconds. "
  default     = 45
}

variable "alb_health_check_matcher" {
  description = "The HTTP codes that are a success when checking TG health."
  default     = "200-299"
}

variable "alb_health_check_path" {
  type        = string
  description = "The URL the ELB should use for health checks. e.g. /health"
}

variable "alb_health_check_port" {
  description = "The port used by the health check if different from the traffic-port."
  default     = "traffic-port"
}

variable "alb_health_check_timeout" {
  description = "Seconds to leave a health check waiting before terminating it and calling the check unhealthy. Range is 2 - 60 seconds"
  default     = 5
}

variable "alb_health_check_unhealthy_threshold" {
  description = "Number of consecutive positive health checks before a backend instance is considered unhealthy."
  default     = 3
}

variable "bucket_name" {
  type    = string
  default = ""
}

variable "enable_healthcheck" {
  description = "alb to perform healthcheck"
}

variable "alb_name" {
  type = string
}

variable "alb_listener_port" {
  type        = string
  description = "The port that the ALB accepts"
}

variable "alb_listener_protocol" {
  type        = string
  description = "The protocol that the ALB accepts"
}

variable "alb_security_groups" {
  type = list(string)
}

variable "alb_ssl_certificate_arn" {
  type        = string
  description = "Full ARN of SSL Certificate"
}

variable "alb_ssl_security_policy" {
  type        = string
  description = "See https://docs.aws.amazon.com/elasticloadbalancing/latest/classic/elb-security-policy-table.html"
}

variable "alb_subnets" {
  type = list(string)
}

variable "alb_target_group_name" {
  type = string
}

variable "vpc" {
  type = string
}

variable "force_destroy_alb_log_bucket" {
  type        = string
  description = "boolean true/false"
  default     = false
}

variable "internal_alb" {
  type        = bool
  description = "boolean true/false"
}

variable "lb_debug" {
  type        = string
  description = "setting of debug, if turned on then we do lb logging to bucket"
  default     = "false"
}


variable "service_name" {
  description = "Name of project or service that this VPC infrastructure relates to."
}