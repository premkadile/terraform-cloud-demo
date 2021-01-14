variable "region" {
  default = "us-west-2"
}

provider "aws" {
region  = var.region
}

#test
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}
