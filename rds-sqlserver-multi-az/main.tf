provider "aws" {
  #   access_key = "${var.access_key}"
  #   secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

resource "aws_db_instance" "default" {
  allocated_storage       = 50
  engine                  = "sqlserver-ee"
  engine_version          = "15.00.4073.23.v1"
  license_model           = "license-included"
  instance_class          = "db.m5.xlarge"
  username                = "foo"
  password                = "foobarbaz"
  multi_az                = true
  backup_retention_period = 7
  skip_final_snapshot     = true
}
