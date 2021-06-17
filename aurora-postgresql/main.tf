provider "aws" {
  #   access_key = "${var.access_key}"
  #   secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

resource "aws_rds_cluster" "default" {
  cluster_identifier  = "aurora-cluster-demo"
  engine              = "aurora-postgresql"
  engine_version      = "11.9"
  availability_zones  = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  database_name       = "mydb"
  master_username     = "test_aurora"
  master_password     = "N1cetest"
  skip_final_snapshot = true
}

resource "aws_rds_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "aurora-cluster-demo-${count.index}"
  cluster_identifier = aws_rds_cluster.default.id
  instance_class     = "db.r5.large"
  engine             = aws_rds_cluster.default.engine
  engine_version     = aws_rds_cluster.default.engine_version
}
