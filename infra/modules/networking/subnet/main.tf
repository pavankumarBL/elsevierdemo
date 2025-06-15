resource "aws_subnet" "public" {
  count                   = var.create_public_subnets ? length(var.azs) : 0
  vpc_id                  = var.vpc_id
  cidr_block              = cidrsubnet(var.vpc_cidr, 4, count.index)
  availability_zone       = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.name}-public-${var.azs[count.index]}"
  }
}

resource "aws_subnet" "private" {
  count             = var.create_private_subnets ? length(var.azs) : 0
  vpc_id            = var.vpc_id
  cidr_block        = cidrsubnet(var.vpc_cidr, 4, count.index + length(var.azs))
  availability_zone = var.azs[count.index]
  tags = {
    Name = "${var.name}-private-${var.azs[count.index]}"
  }
}