##################################################################################################################
#                                                                                                                #
# Stores the state as a given key in a given bucket on Amazon S3.                                                #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/backends/types/s3.html                                          #
#                                                                                                                #
##################################################################################################################

terraform {
  backend "s3" {
    bucket = "mg-nonprod-tfstate"
    key    = "routing-jenkins/nonprod/service/ebs-jenkins/terraform.tfstate"
    region = "eu-west-1"
    acl    = "bucket-owner-full-control"
  }
}
