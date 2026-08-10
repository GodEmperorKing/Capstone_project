terraform {
  required_version = ">= 1.1"

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "6.18.0"
    }
  }
}

provider "aws" {
  # Configuration options
  # This region is NOT the default region for our AWS that we selected,
  # it is just a region we decided to use, hpowever it is required. The 
  # default comes in when we specify a Profile.
  region = "eu-west-3"

  # indicating who will manage the terraform
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
    }
  }
}