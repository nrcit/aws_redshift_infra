resource "aws_redshift_cluster" "default" {
  cluster_identifier = var.cluster_identifier
  node_type          = var.node_type
  master_username    = var.master_username
  master_password    = random_password.password.result
  database_name      = var.database_name
  cluster_type       = var.cluster_type
  number_of_nodes    = var.number_of_nodes
  skip_final_snapshot = true
  vpc_security_group_ids = [aws_security_group.redshift_sg.id]
}

resource "random_password" "password" {
  length           = 16
  special          = true
  override_special = "!%&()-_=+[]?"
}

resource "aws_secretsmanager_secret" "example" {
  name = var.master_password_sec_name
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.example.id
  secret_string = random_password.password.result
}

resource "aws_security_group" "redshift_sg" {
  name        = "redshift-sg"
  description = "Allow Redshift access from anywhere"
  vpc_id      = data.aws_vpc.default.id

  ingress {
    from_port   = 5439
    to_port     = 5439
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # 👈 open to all (dev only!)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}