terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.23.0"
    }
  }
}

provider "aws" {
  region  = "us-west-2"
}
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
