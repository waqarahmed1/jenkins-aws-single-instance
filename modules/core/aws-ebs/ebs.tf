resource "aws_ebs_volume" "attached-volume" {
  availability_zone = var.asg_az
  size              = var.size
  encrypted         = var.encrypted
  iops              = var.iops
  type              = var.type

  tags = {
    "Application"                = var.application
    "Environment "               = var.environment
    "Name"                       = var.ebs_name
  }
}