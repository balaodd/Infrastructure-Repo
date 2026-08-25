resource "aws_vpc" "main" {

  cidr_block = var.vpc_cidr

  tags = {
    Name = "devops-vpc"
  }
}
resource "aws_subnet" "public_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.1.0/24"

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = true

  tags = {
    Name = "public-subnet"
  }
}
resource "aws_subnet" "private_subnet" {

  vpc_id = aws_vpc.main.id

  cidr_block = "10.0.2.0/24"

  availability_zone = "ap-south-1a"

  map_public_ip_on_launch = false

  tags = {
    Name = "private-subnet"
  }
}
resource "aws_internet_gateway" "main" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "devops-igw"
  }
}
resource "aws_route_table" "public_rt" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "public-route-table"
  }
}
resource "aws_route" "internet_route" {

  route_table_id = aws_route_table.public_rt.id

  destination_cidr_block = "0.0.0.0/0"

  gateway_id = aws_internet_gateway.main.id
}

/*
resource "aws_eip" "nat_eip" {

  domain = "vpc"

  tags = {
    Name = "nat-eip"
  }
}
resource "aws_nat_gateway" "main" {

  allocation_id = aws_eip.nat_eip.id

  subnet_id = aws_subnet.public_subnet.id

  tags = {
    Name = "nat-gateway"
  }
}
resource "aws_route_table" "private_rt" {

  vpc_id = aws_vpc.main.id

  tags = {
    Name = "private-route-table"
  }
}
resource "aws_route" "private_internet_route" {

  route_table_id = aws_route_table.private_rt.id

  destination_cidr_block = "0.0.0.0/0"

  nat_gateway_id = aws_nat_gateway.main.id
}
*/