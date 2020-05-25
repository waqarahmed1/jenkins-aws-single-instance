# Provides an Application Load Balancer Listener resource.
# https://www.terraform.io/docs/providers/aws/r/alb_listener.html




resource "aws_alb_listener" "https" {
  count = var.alb_listener_protocol == "HTTPS" ? 1 : 0

  default_action {
    target_group_arn = aws_alb_target_group.target_group.id
    type             = "forward"
  }

  load_balancer_arn = aws_alb.alb.arn
  port              = var.alb_listener_port
  protocol          = "HTTPS" //"HTTPS"
  ssl_policy        = var.alb_ssl_security_policy
  certificate_arn   = var.alb_ssl_certificate_arn
}




resource "aws_alb_listener" "http" {
  count = var.alb_listener_protocol == "HTTP" ? 1 : 0

  default_action {
    target_group_arn = aws_alb_target_group.target_group.id
    type             = "forward"
  }

  load_balancer_arn = aws_alb.alb.arn
  port              = var.alb_listener_port
  protocol          = "HTTP"
}