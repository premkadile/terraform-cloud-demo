provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "demo_bucket" {
  bucket = "tf-gh-actions-demo-123456-${random_id.suffix.hex}"

  tags = {
    Name        = "GitHubActionsDemo"
    Environment = "Dev"
  }
}

resource "random_id" "suffix" {
  byte_length = 4
}

terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}
