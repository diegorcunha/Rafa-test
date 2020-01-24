// Create the Internet Gateway
resource "aws_internet_gateway" "IG" {
  vpc_id              = aws_vpc.VPC.id
  tags                = {Name = "Test"}
}

// Create the Route table
resource "aws_route_table" "route_table" {
  vpc_id              = aws_vpc.VPC.id
  propagating_vgws    = var.public_propagating_vgws
  tags                = {Name = "Test"}
}

// Create the point to create the Route Table
resource "aws_route" "route_point" {
  route_table_id         = aws_route_table.route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.IG.id
}

// Create the Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id                  = aws_vpc.VPC.id
  cidr_block              = var.public_subnets[count.index]
  availability_zone       = element(var.azs, count.index)
  count                   = length(var.public_subnets)
  map_public_ip_on_launch = var.map_public_ip_on_launch
  tags                    = {Name = "Test"}
}

// Create the Route Table
resource "aws_route_table_association" "route_table" {
  count                   = length(var.public_subnets)
  subnet_id               = element(aws_subnet.public_subnet.*.id, count.index)
  route_table_id          = aws_route_table.route_table.id
}