module "mg-jenkins-ebs" {
  source = "../../../../modules/core/aws-ebs"


  application = var.application
  ebs_name = var.ebs_name
  encrypted = var.encrypted
  environment = var.environment
  iops = var.iops
  size = var.size
  type = var.type
}