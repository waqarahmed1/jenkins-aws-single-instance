output "lb_security_group_id" {
  value = module.alb_security_group.security_group_id
}

output "instance_security_group_id" {
  value = module.ec2_security_group.security_group_id
}

output "asg_id" {
  value = module.mg-jenkins-asg.asg_id
}

output "alb_dns" {
  value = module.alb.alb_alias
}

output "instance_role_id" {
  value = aws_iam_role.mg_jenkins_ec2_role.id
}