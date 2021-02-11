resource "aws_vpc" "terraform_vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name = "terraform_vpc"
  }
}

resource "aws_internet_gateway" "terraform_gw" {
  vpc_id = aws_vpc.terraform_vpc.id

  tags = {
    Name = "terraform_gw"
  }
}

resource "aws_subnet" "public_subnet_web" {
  cidr_block        = "10.0.1.0/24"
  vpc_id            = aws_vpc.terraform_vpc.id
  availability_zone = "eu-central-1c"

  tags = {
    Name = "public_subnet_web"
  }
}
resource "aws_subnet" "test-subnet" {
  cidr_block        = "10.0.2.0/24"
  vpc_id            = aws_vpc.terraform_vpc.id
  availability_zone = "eu-central-1c"

  tags = {
    Name = "test_subnet"
  }
}
resource "aws_route" "terraform_r" {
  route_table_id         = aws_route_table.public_rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.terraform_gw.id
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.terraform_vpc.id
}

resource "aws_route_table_association" "a" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.public_subnet_web.id
}

resource "aws_route_table_association" "b" {
  route_table_id = aws_route_table.public_rt.id
  subnet_id      = aws_subnet.test-subnet.id
}
