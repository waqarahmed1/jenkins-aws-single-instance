module "alb_security_group" {
  source                     = "../../../../modules/core/aws-security-groups/groups"
  aws_region                 = var.aws_region
  security_group_description = "Allow access to ALB"
  security_group_name        = "${var.environment}-${var.service_name}-alb-sg"
  vpc_id                     = data.terraform_remote_state.env_vpc.outputs.vpc_id
}


module "ec2_security_group" {
  source                     = "../../../../modules/core/aws-security-groups/groups"
  aws_region                 = var.aws_region
  security_group_description = "Allow access to EC2"
  security_group_name        = "${var.environment}-${var.service_name}-ec2-sg"
  vpc_id                     = data.terraform_remote_state.env_vpc.outputs.vpc_id
}