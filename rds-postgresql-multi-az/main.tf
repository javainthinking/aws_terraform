provider "aws" {
  #   access_key = "${var.access_key}"
  #   secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

resource "aws_db_instance" "default" {
  allocated_storage   = 10
  engine              = "postgres"
  engine_version      = "13"
  instance_class      = "db.r5.large"
  name                = "mydb"
  username            = "foo"
  password            = "foobarbaz"
  multi_az            = true
  skip_final_snapshot = true
}
