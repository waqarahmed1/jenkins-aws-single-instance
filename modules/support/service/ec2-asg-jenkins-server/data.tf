data "aws_caller_identity" "current" {}

data "terraform_remote_state" "env_vpc" {
  backend = "s3"

  config = {
    bucket = "mg-nonprod-tfstate"
    key    = "routing-jenkins/nonprod/infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
}

data "aws_route53_zone" "mgprod_internal_domain" {
  name = "mgnonprod.co.uk"
}

/*
data "terraform_remote_state" "acm_global" {

}

data "terraform_remote_state" "ssm" {
  backend = "s3"

  config = {
    bucket = "mg-nonprod-tfstate"
    key    = "routing-jenkins/${var.account}/${var.environment}/ssms-parameters/terraform.tfstate"
    region = "eu-west-2"
  }
}

*/

data "template_file" "mg_jenkins_bootstrap" {
  template = file("${path.module}/userdata.sh.tpl")

  vars = {
    REGION       = var.aws_region
    ENVIRONMENT  = var.environment
    APPLICATION  = var.application
    SERVICE_NAME = var.service_name
    account      = var.account

  }
}

data "aws_ami_ids" "mg_jenkins_ec2" {
  owners = [data.aws_caller_identity.current.account_id]

  filter {
    name   = "name"
    values = ["mg_jenkins"]
  }
}