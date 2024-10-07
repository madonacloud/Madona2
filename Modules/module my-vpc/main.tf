#my vpc resource block
resource "aws_vpc" "demo" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"

  tags = {
    Name = "${var.my_project_title}-vpc"
  }
}

#Creation of Internet Gateway and attachment to VPC
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.demo.id

  tags = {
    Name = "${var.my_project_title}-igw"
  }
}

#we are going to use data source to state all availability zones.
data "aws_availability_zones" "available" {}

#creation of our public subnet in az1
resource "aws_subnet" "pub_sn_az1" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.pub_sn_az1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_sn_az1"
  }
}

#creation of our public subnet in az2
resource "aws_subnet" "pub_sn_az2" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.pub_sn_az2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = true

  tags = {
    Name = "pub_sn_az2"
  }
}

#The creation of public route table and route editing for internet gateway.
resource "aws_route_table" "pub_rt" {
  vpc_id = aws_vpc.demo.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw.id
  }

  tags = {
    Name = "pub_rt"
  }
}

#Association of our first public subnet in az1 with the public route table.
resource "aws_route_table_association" "pub_sn_association_az1" {
  subnet_id      = aws_subnet.pub_sn_az1.id
  route_table_id = aws_route_table.pub_rt.id
}

#Association of our first public subnet in az2 with the public route table.
resource "aws_route_table_association" "pub_sn_association_az1" {
  subnet_id      = aws_subnet.pub_sn_az2.id
  route_table_id = aws_route_table.pub_rt.id
}

#Creation of private application subnet in az1
resource "aws_subnet" "priv_application_tier_sn_az1" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.priv_application_tier_sn_az1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "priv_application_tier_sn_az1"
  }
}

#Creation of private application subnet az2.
resource "aws_subnet" "priv_application_tier_sn_az2" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.priv_application_tier_sn_az2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "priv_application_tier_sn_az2"
  }
}

#Creation of private data tier subnet az1.
resource "aws_subnet" "priv_data_tier_sn_az1" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.priv_data_tier_sn_az1_cidr
  availability_zone = data.aws_availability_zones.available.names[0]
  map_public_ip_on_launch = false

  tags = {
    Name = "priv_data_tier_sn_az1"
  }
}

#Creation of private data tier subnet az1.
resource "aws_subnet" "priv_data_tier_sn_az2" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = var.priv_data_tier_sn_az2_cidr
  availability_zone = data.aws_availability_zones.available.names[1]
  map_public_ip_on_launch = false

  tags = {
    Name = "priv_data_tier_sn_az2"
}
}