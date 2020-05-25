# Provides an Application Load Balancer resource.
# https://www.terraform.io/docs/providers/aws/r/alb.html

resource "aws_alb" "alb" {
  name            = var.alb_name
  subnets         = var.alb_subnets
  security_groups = var.alb_security_groups
  internal        = var.internal_alb

  access_logs {
    bucket  = var.bucket_name
    prefix  = ""
    enabled = var.alb_enable_logging
  }

  tags = {
    Name        = "${var.environment}-${var.service_name}-alb"
    Type        = "ALB"
    Environment = var.environment
  }

}
