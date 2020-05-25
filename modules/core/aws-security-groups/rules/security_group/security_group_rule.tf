##################################################################################################################
#                                                                                                                #
# aws_security_group_rule Provides a security group rule resource. Represents a single ingress or egress group   #
# rule, which can be added to external Security Groups.                                                          #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/security_group_rule.html                        #
#                                                                                                                #
##################################################################################################################

resource "aws_security_group_rule" "rule" {
  type                     = var.type
  from_port                = var.from_port
  to_port                  = var.to_port
  protocol                 = var.protocol
  source_security_group_id = var.source_security_group_id
  security_group_id        = var.security_group_id
  description              = var.description
}

