module "alb" {
  source = "../../../../modules/core/aws-alb"

  aws_region   = var.aws_region
  environment  = var.environment
  vpc          = data.terraform_remote_state.env_vpc.outputs.vpc_id
  service_name = "alb"

  # ALB
  internal_alb        = false
  alb_name            = "${var.environment}-${var.service_name}"
  alb_subnets         = split(",", data.terraform_remote_state.env_vpc.outputs.public_subnet_ids)
  alb_security_groups = [module.alb_security_group.security_group_id]
  enable_healthcheck  = true
  lb_debug            = false

  # ALB Listener
  alb_listener_port     = var.lb_listener_port
  alb_listener_protocol = var.lb_listener_protocol
  # Required if listener protocol is HTTPS
  alb_ssl_certificate_arn = var.ssl_certificate_arn //data.terraform_remote_state.acm_global.outputs.acm_certificate_arn #data acm
  alb_ssl_security_policy = "ELBSecurityPolicy-2016-08"


  # Target Group
  alb_backend_port         = var.instance_listener_port
  alb_backend_protocol     = var.instance_listener_protocol
  alb_health_check_path    = var.lb_health_check_path
  alb_health_check_port    = var.lb_health_check_port
  alb_deregistration_delay = 30
  alb_target_group_name    = "${var.environment}-${var.service_name}-tg"

}

resource "aws_lb_listener" "redirect" {
  load_balancer_arn = module.alb.alb_id
  port              = 80
  protocol          = "HTTP"
  default_action {
    type = "redirect"

    redirect {
      status_code = "HTTP_301"
      port        = "443"
      protocol    = "HTTPS"
    }
  }
}