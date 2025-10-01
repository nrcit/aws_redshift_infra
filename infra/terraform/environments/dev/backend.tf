terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-nrcit-464037860553"
    key            = "dev/redshift/terraform.tfstate"
    region         = "eu-west-2"
 }
}
