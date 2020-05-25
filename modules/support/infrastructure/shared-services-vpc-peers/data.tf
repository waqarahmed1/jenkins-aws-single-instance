data "aws_caller_identity" "current" {}

data "terraform_remote_state" "env_vpc" {
  backend = "s3"

  config = {
    bucket = "mg-nonprod-tfstate"
    key    = "routing-jenkins/nonprod/infrastructure/terraform.tfstate"
    region = "eu-west-1"
  }
}