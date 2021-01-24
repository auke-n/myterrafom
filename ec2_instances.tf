resource "aws_instance" "JumpBox" {
  ami                         = "ami-03c3a7e4263fd998c"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.Public_Subnet_JB.id
  vpc_security_group_ids      = [aws_security_group.JB_SG.id]
  key_name                    = "Frankfurt"
  associate_public_ip_address = true

  tags = {
    Name = "Jumpbox"
  }
}

resource "aws_instance" "WEB-Server" {
  ami                         = "ami-03c3a7e4263fd998c"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.Public_Subnet_WEB.id
  vpc_security_group_ids      = [aws_security_group.WEB_SG.id]
  key_name                    = "Frankfurt"
  associate_public_ip_address = true

  tags = {
    Name = "WEB-Server"
  }
}