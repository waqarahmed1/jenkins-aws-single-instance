/*
Lock the version of Terraform to being equal to or newer to the version below along with less than the next major version
Lock the provider version for AWS provider to be equal to or newer than the version bellow along with less than the next major version.
These allow newer versions but not jumps to the next major version which is more likely to have breaking changes.
*/
terraform {
  required_version = "~> 0.12.24"

  required_providers {
    aws = "~> 2.50"
  }
}