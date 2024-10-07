#my backend configuration
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.68.0"
    }
  }

  backend "s3" {
    bucket         = "my-terraform-jharics-project-files"
    key            = "my-terraform-tfstate-files"
    region         = "us-east-2"
    encrypt        = true
    dynamodb_table = "terraform-dynamoDB-table"
  }
}