##################################################################################################################
#                                                                                                                #
# aws_vpc_endpoint: Provides a resource to create a VPC endpoint.                                                #
#                                                                                                                #
# Further reading: https://www.terraform.io/docs/providers/aws/r/vpc_endpoint.html                               #
#                                                                                                                #
##################################################################################################################

resource "aws_vpc_endpoint" "s3" {
  vpc_id       = aws_vpc.vpc.id
  service_name = "com.amazonaws.${var.aws_region}.s3"
}

resource "aws_vpc_endpoint_route_table_association" "s3_endpoint_association" {
  count           = var.az_limit
  route_table_id  = element(aws_route_table.private_route_table.*.id, count.index)
  vpc_endpoint_id = aws_vpc_endpoint.s3.id
}

