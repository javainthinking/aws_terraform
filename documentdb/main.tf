provider "aws" {
  #   access_key = "${var.access_key}"
  #   secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

resource "aws_docdb_cluster_instance" "cluster_instances" {
  count              = 2
  identifier         = "docdb-cluster-demo-${count.index}"
  cluster_identifier = aws_docdb_cluster.default.id
  instance_class     = "db.r5.large"
}

resource "aws_docdb_cluster" "default" {
  cluster_identifier  = "docdb-cluster-demo"
  availability_zones  = ["ap-southeast-1a", "ap-southeast-1b", "ap-southeast-1c"]
  master_username     = "foo"
  master_password     = "N1cetest"
  skip_final_snapshot = true
}
