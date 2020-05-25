output "target_group_arn" {
  value = aws_alb_target_group.target_group.arn
}

output "alb_id" {
  value = aws_alb.alb.id
}

output "alb_alias" {
  value = aws_alb.alb.dns_name
}

output "alb_zone_id" {
  value = aws_alb.alb.zone_id
}

output "alb_dns_name" {
  value = aws_alb.alb.dns_name
}

