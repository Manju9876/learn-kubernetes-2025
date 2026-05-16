provider "aws" {
  region = "us-east-1"
}
terraform {
  backend "s3" {
    bucket = "wmp-terraform-data"
    key    = "learn-kubernetes/env-dev/terraform.tfstate"
    region = "us-east-1"
  }
}

