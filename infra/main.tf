
# # Internet Gateway for Private VPC
# resource "aws_internet_gateway" "private_igw" {
#   vpc_id = module.private_vpc.vpc_id
#   tags = {
#     Name = "private-vpc-igw"
#   }
# }

# # Elastic IPs for NAT Gateways
# resource "aws_eip" "private_nat_eips" {
#   count = length(module.private_vpc.public_subnet_ids)
#   tags = {
#     Name = "private-vpc-nat-eip-${count.index}"
#   }
# }

# # NAT Gateways for Private VPC
# resource "aws_nat_gateway" "private_nat_gateways" {
#   count         = length(module.private_vpc.public_subnet_ids)
#   allocation_id = aws_eip.private_nat_eips[count.index].id
#   subnet_id     = element(module.private_vpc.public_subnet_ids, count.index)
#   tags = {
#     Name = "private-vpc-nat-${count.index}"
#   }
# }

# # Public Route Table for Private VPC
# resource "aws_route_table" "private_public_rt" {
#   vpc_id = module.private_vpc.vpc_id
#   tags = {
#     Name = "private-public-rt"
#   }
# }

# # Route for Internet Access in Public Route Table
# resource "aws_route" "private_public_internet_route" {
#   route_table_id         = aws_route_table.private_public_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   gateway_id             = aws_internet_gateway.private_igw.id
# }

# # Associate Public Subnets with Public Route Table
# resource "aws_route_table_association" "private_public_rt_assoc" {
#   count          = length(module.private_vpc.public_subnet_ids)
#   subnet_id      = element(module.private_vpc.public_subnet_ids, count.index)
#   route_table_id = aws_route_table.private_public_rt.id
# }

# # Route for NAT Gateway in Private Route Table
# resource "aws_route" "private_private_nat_route" {
#   count                 = length(module.private_vpc.private_subnet_ids)
#   route_table_id        = aws_route_table.private_private_rt.id
#   destination_cidr_block = "0.0.0.0/0"
#   nat_gateway_id        = element(aws_nat_gateway.private_nat_gateways.*.id, count.index % length(aws_nat_gateway.private_nat_gateways))
# }