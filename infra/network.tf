# Private Route Table for Private VPC
resource "aws_route_table" "private_private_rt" {
  vpc_id = module.private_vpc.vpc_id
  tags = {
    Name = "private-private-rt"
  }
}

# Associate Private Subnets with Private Route Table
resource "aws_route_table_association" "private_private_rt_assoc" {
  count          = length(module.private_vpc_private_subnets.private_subnet_ids)
  subnet_id      = element(module.private_vpc_private_subnets.private_subnet_ids, count.index)
  route_table_id = aws_route_table.private_private_rt.id
}