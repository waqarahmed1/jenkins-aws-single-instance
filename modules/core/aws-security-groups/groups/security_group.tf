##################################################################################################################
#                                                                                                                #
# aws_security_group provides details about a specific Security Group.                                           #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/d/security_group.html                             #
#                                                                                                                #
##################################################################################################################

resource "aws_security_group" "security_group" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = var.vpc_id

  tags = {
    Account     = var.account
    Environment = var.environment
    Name        = var.security_group_name
    Terraform   = "true"
  }
}

