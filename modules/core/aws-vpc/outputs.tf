##################################################################################################################
#                                                                                                                #
# Outputs are a way to tell Terraform what data is important. This data is outputted when apply is called, and   # 
# can be queried using the terraform output command.                                                             #
#                                                                                                                #
# Further reading: https://www.terraform.io/intro/getting-started/outputs.html                                   #
#                                                                                                                #
##################################################################################################################
output "account_owner" {
  value = data.aws_caller_identity.current.account_id
}

output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr_block" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnet_ids" {
  value = join(",", aws_subnet.subnet_public.*.id)
}

output "private_subnet_ids" {
  value = join(",", aws_subnet.subnet_private.*.id)
}

output "nat_gateway_ip_address" {
  value = join(",", aws_nat_gateway.nat_gateway.*.public_ip)
}

output "nat_gateway_ids" {
  value = join(",", aws_nat_gateway.nat_gateway.*.id)
}

output "public_route_table_ids" {
  value = join(",", aws_route_table.public_route_table.*.id)
}

output "private_route_table_ids" {
  value = join(",", aws_route_table.private_route_table.*.id)
}

output "private_route_table_count" {
  value = var.az_limit
}

output "public_route_table_count" {
  value = "1"
}

output "availability_zones" {
  value = join(",", aws_subnet.subnet_private.*.availability_zone)
}

output "endpoint_id" {
  value = aws_vpc_endpoint.s3.id
}

output "prefix_list_id" {
  value = aws_vpc_endpoint.s3.prefix_list_id
}

output "route_table_id" {
  value = aws_route_table.private_route_table[0].id
}