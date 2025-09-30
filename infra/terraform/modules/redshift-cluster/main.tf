resource "aws_redshift_cluster" "this" {
  cluster_identifier = var.cluster_identifier
  node_type          = var.node_type
  master_username    = var.master_username
  master_password    = random_password.password.result
  database_name      = var.database_name
  cluster_type       = var.cluster_type
  number_of_nodes    = var.number_of_nodes
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!%&()-_=+[]?"
}

resource "aws_secretsmanager_secret" "example" {
  name = "redshift-master-password1"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = random_password.password.result
}