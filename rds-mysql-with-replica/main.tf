provider "aws" {
  #   access_key = "${var.access_key}"
  #   secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

resource "aws_db_instance" "master" {
  allocated_storage       = 10
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.r5.large"
  name                    = "mydb"
  username                = "foo"
  password                = "foobarbaz"
  parameter_group_name    = "default.mysql8.0"
  backup_retention_period = 7
  skip_final_snapshot     = true
}

resource "aws_db_instance" "replica" {
  allocated_storage    = 10
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = "db.r5.large"
  name                 = "mydb"
  replicate_source_db  = aws_db_instance.master.id
  parameter_group_name = "default.mysql8.0"
  skip_final_snapshot  = true
}
