# ALB Inbound from MG offices
module "security_group_rules_inbound_from_mg_1_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "54.154.100.54/32"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_inbound_from_mg_2_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "52.214.146.43/32"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_inbound_from_mg_vpn_range1_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "34.241.17.147/32"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_inbound_from_mg_vpn_range2_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "34.240.230.125/32"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_inbound_from_mg_vpn_range3_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "52.50.196.10/32"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_inbound_from_mg_vpn_range4_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "62.254.12.218/32"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_outbound_http_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "0.0.0.0/0"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "egress"
}

module "security_group_rules_outbound_jenkins_port_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "0.0.0.0/0"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "egress"
}

module "security_group_rules_alb_outbound_http_ec2" {
  source                   = "../../../../modules/core/aws-security-groups/rules/security_group"
  aws_region               = var.aws_region
  from_port                = "80"
  to_port                  = "80"
  protocol                 = "tcp"
  security_group_id        = module.ec2_security_group.security_group_id
  source_security_group_id = module.alb_security_group.security_group_id
  type                     = "egress"
}


module "security_group_rules_alb_inbound_http_ec2" {
  source                   = "../../../../modules/core/aws-security-groups/rules/security_group"
  aws_region               = var.aws_region
  from_port                = "8080"
  to_port                  = "8080"
  protocol                 = "tcp"
  security_group_id        = module.ec2_security_group.security_group_id
  source_security_group_id = module.alb_security_group.security_group_id
  type                     = "ingress"
}

module "security_group_rules_outbound_http_ec2" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "0.0.0.0/0"
  from_port         = "80"
  to_port           = "80"
  protocol          = "tcp"
  security_group_id = module.ec2_security_group.security_group_id
  type              = "egress"
}

module "security_group_rules_outbound_https_ec2" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "0.0.0.0/0"
  from_port         = "443"
  to_port           = "443"
  protocol          = "tcp"
  security_group_id = module.ec2_security_group.security_group_id
  type              = "egress"
}

module "security_group_rules_outbound_s3" {
  source = "../../../../modules/core/aws-security-groups/rules/prefix-list-id"

  aws_region        = var.aws_region
  from_port         = "0"
  prefix_list_id    = data.terraform_remote_state.env_vpc.outputs.prefix_list_id
  protocol          = "-1"
  security_group_id = module.ec2_security_group.security_group_id
  to_port           = "0"
  type              = "egress"
}

# ALB Inbound from GitHub hooks - https://api.github.com/meta
module "security_group_rules_inbound_from_github_1_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "192.30.252.0/22"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_inbound_from_github_2_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "185.199.108.0/22"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}

module "security_group_rules_inbound_from_github_3_to_alb" {
  source = "../../../../modules/core/aws-security-groups/rules/cidr"

  aws_region        = var.aws_region
  cidr_blocks       = "140.82.112.0/20"
  from_port         = "8080"
  to_port           = "8080"
  protocol          = "tcp"
  security_group_id = module.alb_security_group.security_group_id
  type              = "ingress"
}
