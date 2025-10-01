provider "aws" {
  region = "us-east-1"
}

module "redshift" {
  source            = "../../modules/redshift-cluster"
  cluster_identifier = "dev-redshift2"
  node_type          = "ra3.xlplus"
  master_username    = "dev_admin"
  database_name      = "devdb"
  cluster_type       = "single-node"
  master_password_sec_name = "dev-redshift-master-password2"
}
