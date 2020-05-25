resource "aws_launch_configuration" "lc" {
  count = var.create_lc ? 1 : 0

  name_prefix = "${var.placement}-${var.asg_name}-lc-"

  image_id                    = var.image_id
  iam_instance_profile        = var.iam_instance_profile
  instance_type               = var.instance_type
  user_data                   = var.lc_user_data
  key_name                    = var.key_name
  security_groups             = var.security_groups
  associate_public_ip_address = var.associate_public_ip_address
  placement_tenancy           = var.placement_tenancy
  ebs_optimized               = var.ebs_optimised

  dynamic "root_block_device" {
    for_each = var.root_block_device
    content {
      delete_on_termination = lookup(root_block_device.value, "delete_on_termination", null)
      encrypted             = lookup(root_block_device.value, "encrypted", null)
      iops                  = lookup(root_block_device.value, "iops", null)
      volume_size           = lookup(root_block_device.value, "volume_size", null)
      volume_type           = lookup(root_block_device.value, "volume_type", null)
    }
  }


  lifecycle {
    create_before_destroy = true
  }
}