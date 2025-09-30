provider "aws" {
  region = "us-east-1"
}

module "redshift" {
  source            = "../../modules/redshift-cluster"
  cluster_identifier = "dev-redshift"
  node_type          = "dc1.large"
  master_username    = "dev_admin"
  database_name      = "devdb"
  cluster_type       = "single-node"
}
