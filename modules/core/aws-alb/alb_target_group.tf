# Provides a Target Group resource for use with Application Load Balancer resources.
# https://www.terraform.io/docs/providers/aws/r/alb_target_group.html

resource "aws_alb_target_group" "target_group" {
  name                 = var.alb_target_group_name
  port                 = var.alb_backend_port
  protocol             = var.alb_backend_protocol
  vpc_id               = var.vpc
  deregistration_delay = var.alb_deregistration_delay


  health_check {
    interval            = var.alb_health_check_interval
    path                = var.alb_health_check_path
    port                = var.alb_health_check_port
    healthy_threshold   = var.alb_health_check_healthy_threshold
    unhealthy_threshold = var.alb_health_check_unhealthy_threshold
    timeout             = var.alb_health_check_timeout
    protocol            = "HTTP" //var.alb_backend_protocol
    matcher             = var.alb_health_check_matcher
    enabled             = var.enable_healthcheck
  }
}
