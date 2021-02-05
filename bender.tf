resource "aws_instance" "bender" {
  ami                         = "ami-0a8281e09e54e48fb"
  instance_type               = "t2.micro"
  subnet_id                   = aws_subnet.public_subnet_web.id
  vpc_security_group_ids      = [aws_security_group.web_sg.id]
  key_name                    = "Frankfurt"
  associate_public_ip_address = true

  tags = {
    Name = "bender"
  }
}