variable "cluster_identifier" {
    type = string
}
variable "node_type" {
    # type = string
}
variable "master_username" {
    type = string
}
variable "database_name" {
    type = string
}
variable "cluster_type" { 
    type = string
    default = "single-node" 
}
variable "number_of_nodes" { 
    type = number
    default = 1 
}
