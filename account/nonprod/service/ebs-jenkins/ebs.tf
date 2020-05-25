module "prod_ebs" {
  source                     = "../../../../modules/support/service/ebs-jenkins"

  application = "routing-service"
  ebs_name = "jenkins"
  encrypted = false
  environment = "nonprod"
  iops = 300
  size = 100
  type = "gp2"
}