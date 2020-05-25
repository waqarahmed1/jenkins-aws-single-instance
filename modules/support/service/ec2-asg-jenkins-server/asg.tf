module "mg-jenkins-asg" {
  source = "../../../../modules/core/aws-ec2-asg"

  additional_ebs_device       = [{}]
  asg_instance_name           = "${var.environment}-${var.service_name}-instance"
  asg_name                    = "${var.environment}-${var.service_name}"
  associate_public_ip_address = false
  create_asg                  = true
  create_lc                   = true
  desired_capacity            = 1
  ebs_optimised               = false
  environment                 = var.environment
  iam_instance_profile        = aws_iam_instance_profile.instance_profile.name
  image_id                    = "ami-0f9d6b20ecfc88d05" //"ami-25e7705c" //ami-067842941deea56b1" //"ami-25e7705c" //"ami-0c3865897c609a6fa"  //   element(data.aws_ami_ids.mg_jenkins_ec2.ids, 1)
  instance_type               = "t3.medium"
  key_name                    = var.keypair
  lc_user_data                = data.template_file.mg_jenkins_bootstrap.rendered
  load_balancers              = []
  max_size                    = 1
  min_size                    = 1
  placement                   = "private"
  root_block_device = [
    {
      delete_on_termination = true
      encrypted             = false
      volume_size           = 50
      volume_type           = "gp2"
    }
  ]
  security_groups      = [module.ec2_security_group.security_group_id]
  tags_as_map          = var.tags
  target_group_arns    = [module.alb.target_group_arn]
  termination_policies = ["Default"]
  vpc_zone_identifier  = split(",", data.terraform_remote_state.env_vpc.outputs.private_subnet_ids)
  health_check_type    = "ELB"
  application          = var.application
  ebs_name             = var.ebs_name
}