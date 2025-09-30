terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-nrcit-464037860553"
    key            = "redshift/terraform.tfstate"
    region         = "us-east-1"
#    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
