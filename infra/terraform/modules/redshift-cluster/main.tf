# # https://registry.terraform.io/providers/rgeraskin/aws3/latest/docs/resources/redshift_cluster
# resource "aws_redshift_cluster" "default" {
#   cluster_identifier = var.cluster_identifier
#   node_type          = var.node_type
#   master_username    = var.master_username
#   master_password    = random_password.password.result
#   database_name      = var.database_name
#   cluster_type       = var.cluster_type
#   number_of_nodes    = var.number_of_nodes
#   skip_final_snapshot = true
#   vpc_security_group_ids = [aws_security_group.redshift_sg.id]
# }

# # https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/password
# resource "random_password" "password" {
#   length           = 16
#   special          = true
#   override_special = "!%&()-_=+[]?"
# }

# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/secretsmanager_secret_version
# resource "aws_secretsmanager_secret" "example" {
#   name = var.master_password_sec_name
# }

# resource "aws_secretsmanager_secret_version" "example" {
#   secret_id     = aws_secretsmanager_secret.example.id
#   secret_string = random_password.password.result
# }
# # https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/security_group
# resource "aws_security_group" "redshift_sg" {
#   name        = "redshift-sg"
#   description = "Allow Redshift access from anywhere"
#   vpc_id      = data.aws_vpc.default.id

#   ingress {
#     from_port   = 5439
#     to_port     = 5439
#     protocol    = "tcp"
#     cidr_blocks = ["0.0.0.0/0"] 
#   }

#   egress {
#     from_port   = 0
#     to_port     = 0
#     protocol    = "-1"
#     cidr_blocks = ["0.0.0.0/0"]
#   }
# }
# data "aws_vpc" "default" {
#   default = true
# }