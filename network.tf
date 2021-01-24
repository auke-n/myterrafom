resource "aws_vpc" "Terraform_VPC" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "Terraform_VPC"
  }
}

resource "aws_internet_gateway" "Terraform_GW" {
  vpc_id = aws_vpc.Terraform_VPC.id

  tags = {
    Name = "Terraform_GW"
  }
}

resource "aws_subnet" "Private1_Subnet" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.Terraform_VPC.id
  availability_zone = "eu-central-1a"

  tags = {
    Name = "Private1_Subnet"
  }
}

resource "aws_subnet" "Private_Subnet_RDS" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.Terraform_VPC.id
  availability_zone = "eu-central-1b"

  tags = {
    Name = "Private_Subnet_RDS"
  }
}

resource "aws_subnet" "Public_Subnet_JB" {
  cidr_block        = "10.0.3.0/24"
  vpc_id            = aws_vpc.Terraform_VPC.id
  availability_zone = "eu-central-1c"

  tags = {
    Name = "Public_Subnet_JB"
  }
}

resource "aws_subnet" "Public_Subnet_WEB" {
  cidr_block        = "10.0.4.0/24"
  vpc_id            = aws_vpc.Terraform_VPC.id
  availability_zone = "eu-central-1c"

  tags = {
    Name = "Public_Subnet_WEB"
  }
}

resource "aws_route" "Terraform_R" {
  route_table_id         = aws_vpc.Terraform_VPC.default_route_table_id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.Terraform_GW.id
}

resource "aws_route_table" "Private_RT" {
  vpc_id = aws_vpc.Terraform_VPC.id
}

resource "aws_route_table_association" "a" {
  route_table_id = aws_route_table.Private_RT.id
  subnet_id      = aws_subnet.Private1_Subnet.id
}

resource "aws_route_table_association" "b" {
  route_table_id = aws_route_table.Private_RT.id
  subnet_id      = aws_subnet.Private_Subnet_RDS.id
}