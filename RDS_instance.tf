resource "aws_db_instance" "My_DB" {
  identifier             = "db-mysql"
  instance_class         = "db.t2.micro"
  allocated_storage      = 20
  storage_type           = "gp2"
  engine                 = "mysql"
  engine_version         = "8.0.20"
  name                   = "mydb"
  username               = "foo"
  password               = "foobarbaz"
  parameter_group_name   = "default.mysql8.0"
  db_subnet_group_name   = aws_db_subnet_group.RDS_SG.id
  vpc_security_group_ids = [aws_security_group.RDS_SG.id]
  skip_final_snapshot    = true

  tags = {
    Name = "DB_MYSQL"
  }
}

resource "aws_db_subnet_group" "RDS_SG" {
  subnet_ids = [aws_subnet.Private_Subnet_RDS.id, aws_subnet.Private1_Subnet.id]
}