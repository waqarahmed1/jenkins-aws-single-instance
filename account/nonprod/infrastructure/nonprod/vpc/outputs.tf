##################################################################################################################
#                                                                                                                #
# Outputs are a way to tell Terraform what data is important. This data is outputted when apply is called, and   #
# can be queried using the terraform output command.                                                             #
#                                                                                                                #
# Further reading: https://www.terraform.io/intro/getting-started/outputs.html                                   #
#                                                                                                                #
##################################################################################################################

output "vpc_id" {
  value = module.shared_services_nonprod_vpc.vpc_id
}

output "vpc_cidr_block" {
  value = module.shared_services_nonprod_vpc.vpc_cidr_block
}

output "public_subnet_ids" {
  value = module.shared_services_nonprod_vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.shared_services_nonprod_vpc.private_subnet_ids
}

output "public_subnet_ids_fmt" {
  value = split(",", module.shared_services_nonprod_vpc.public_subnet_ids)
}

output "private_subnet_ids_fmt" {
  value = split(",", module.shared_services_nonprod_vpc.private_subnet_ids)
}

output "nat_gateway_ip_address" {
  value = module.shared_services_nonprod_vpc.nat_gateway_ip_address
}

output "nat_gateway_ip_address_fmt" {
  value = split(",", module.shared_services_nonprod_vpc.nat_gateway_ip_address)
}

output "nat_gateway_ip_address_cidr" {
  value = formatlist(
    "%s/32",
    split(",", module.shared_services_nonprod_vpc.nat_gateway_ip_address),
  )
  description = "Gateway IP addresses with /32 added and results split into a list"
}

output "nat_gateway_ids" {
  value = module.shared_services_nonprod_vpc.nat_gateway_ids
}

output "private_route_table_ids" {
  value = module.shared_services_nonprod_vpc.private_route_table_ids
}

output "public_route_table_ids" {
  value = module.shared_services_nonprod_vpc.public_route_table_ids
}

output "availability_zones" {
  value = module.shared_services_nonprod_vpc.availability_zones
}

output "public_route_table_count" {
  value = module.shared_services_nonprod_vpc.public_route_table_count
}

output "private_route_table_count" {
  value = module.shared_services_nonprod_vpc.private_route_table_count
}

output "endpoint_id" {
  value = module.shared_services_nonprod_vpc.endpoint_id
}

output "prefix_list_id" {
  value = module.shared_services_nonprod_vpc.prefix_list_id
}

output "route_table_id" {
  value = module.shared_services_nonprod_vpc.route_table_id
}