provider "aws" {
  #   access_key = "${var.access_key}"
  #   secret_key = "${var.secret_key}"
  region = "ap-southeast-1"
}

resource "aws_redshift_cluster" "default" {
  cluster_identifier  = "tf-redshift-cluster"
  database_name       = "mydb"
  master_username     = "foo"
  master_password     = "Mustbe8characters"
  node_type           = "dc1.8xlarge"
  cluster_type        = "multi-node"
  number_of_nodes     = 8
  skip_final_snapshot = true
}
