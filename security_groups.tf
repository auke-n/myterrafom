resource "aws_security_group" "JB_SG" {
  name   = "JB_SG"
  vpc_id = aws_vpc.Terraform_VPC.id

  ingress {
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
    cidr_blocks = ["94.179.187.228/32"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "JB_SG"
  }
}

resource "aws_security_group" "WEB_SG" {
  name   = "WEB_SG"
  vpc_id = aws_vpc.Terraform_VPC.id

  ingress {
    from_port       = 22
    protocol        = "tcp"
    to_port         = 22
    security_groups = [aws_security_group.JB_SG.id]
  }
  ingress {
    from_port   = 80
    protocol    = "tcp"
    to_port     = 80
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "WEB_SG"
  }
}

resource "aws_security_group" "RDS_SG" {
  name   = "RDS-SG"
  vpc_id = aws_vpc.Terraform_VPC.id

  ingress {
    from_port       = 3306
    protocol        = "tcp"
    to_port         = 3306
    security_groups = [aws_security_group.JB_SG.id, aws_security_group.WEB_SG.id]
  }
  egress {
    from_port   = 0
    protocol    = "-1"
    to_port     = 0
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "RDS_SG"
  }
}