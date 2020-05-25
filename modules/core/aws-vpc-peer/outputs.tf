##################################################################################################################
#                                                                                                                #
# Outputs are a way to tell Terraform what data is important. This data is outputted when apply is called, and   # 
# can be queried using the terraform output command.                                                             #
#                                                                                                                #
# Further reading: https://www.terraform.io/intro/getting-started/outputs.html                                   #
#                                                                                                                #
##################################################################################################################

output "peering_connection_id" {
  value = aws_vpc_peering_connection.peer.id
}