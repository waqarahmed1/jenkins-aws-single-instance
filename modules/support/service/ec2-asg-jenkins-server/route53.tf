resource "aws_route53_record" "alb" {
  count   = var.alb_dns
  zone_id = data.aws_route53_zone.mgprod_internal_domain.zone_id
  name    = var.domain_name
  type    = "A"

  alias {
    name                   = module.alb.alb_dns_name
    zone_id                = module.alb.alb_zone_id
    evaluate_target_health = true
  }
}