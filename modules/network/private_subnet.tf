// # Private Subnet Configure

resource "aws_eip" "ipwan" {
  count           = length(var.public_subnets)
  depends_on      = [aws_internet_gateway.IG]
  vpc             = true

}

resource "aws_nat_gateway" "GW" {
  count             = length(var.public_subnets)
  allocation_id     = element(aws_eip.ipwan.*.id, count.index)
  subnet_id         = element(aws_subnet.public_subnet.*.id, count.index)
  depends_on        = [aws_internet_gateway.IG]
}

resource "aws_route_table" "private" {
  vpc_id           = aws_vpc.VPC.id
  propagating_vgws = var.private_propagating_vgws
  count            = length(var.private_subnets)
  tags             = {Name = "test"}
}

resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.VPC.id
  cidr_block        = var.private_subnets[count.index]
  availability_zone = element(var.azs, count.index)
  count             = length(var.private_subnets)
  tags              = {Name = "test"}
}

resource "aws_route_table_association" "private" {
  count           = length(var.private_subnets)
  subnet_id       = element(aws_subnet.private.*.id, count.index)
  route_table_id  = element(aws_route_table.private.*.id, count.index)

}

resource "aws_route" "private_nat_gateway" {
  route_table_id         = element(aws_route_table.private.*.id, count.index)
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id         = element(aws_nat_gateway.GW.*.id, count.index)
  count                  = length(var.private_subnets)
  depends_on             = [aws_nat_gateway.GW]
}