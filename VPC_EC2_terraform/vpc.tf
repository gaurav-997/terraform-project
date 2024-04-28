provider "aws" {
  region     = var.aws_region
  access_key = var.access_key
  secret_key = var.secret_key

}

resource "aws_vpc" "custom_vpc" {
  cidr_block = var.cidr_block

  tags = {
    Name = "First_VPC"
  }
}

resource "aws_subnet" "public_subnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Public Subnet"
  }
}

resource "aws_subnet" "private_subnet" {
  vpc_id            = aws_vpc.custom_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1a"

  tags = {
    Name = "Private Subnet"
  }
}

resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.custom_vpc.id

  tags = {
    Name = "Internet Gateway"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.custom_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }

  route {
    ipv6_cidr_block = "::/0"
    gateway_id      = aws_internet_gateway.ig.id
  }

  tags = {
    Name = "Public Route Table"
  }
}

resource "aws_route_table_association" "public_1_rt_a" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.public_rt.id
}   