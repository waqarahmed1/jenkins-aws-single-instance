resource "aws_autoscaling_group" "asg" {
  count = var.create_asg ? 1 : 0

  name = "${var.asg_name}-ASG"
  availability_zones = [var.asg_az]
  launch_configuration = var.create_lc ? element(aws_launch_configuration.lc.*.name, 0) : var.launch_configuration
  max_size             = var.max_size
  min_size             = var.min_size
  desired_capacity     = var.desired_capacity
  vpc_zone_identifier  = var.vpc_zone_identifier
  load_balancers       = var.load_balancers
  target_group_arns    = var.target_group_arns
  termination_policies = var.termination_policies
  force_delete         = var.force_delete
  health_check_type    = var.health_check_type
  health_check_grace_period = 600

  tags = concat(
    [
      {
        "key"                 = "Terraform"
        "value"               = "true"
        "propagate_at_launch" = true
      },
    ],
    var.tags,
    local.additional_tags,
  )


  lifecycle {
    create_before_destroy = true
  }
}