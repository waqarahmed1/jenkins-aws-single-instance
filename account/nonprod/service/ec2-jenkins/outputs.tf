output "ec2_security_group_id" {
  value = module.prod_ec2.instance_security_group_id
}

output "instance_role_id" {
  value = module.prod_ec2.instance_role_id
}