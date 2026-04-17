terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }

  backend "s3" {
    bucket = "peter-heywood-terraform"
    key    = "state"
    region = "eu-west-2"
  }
}
