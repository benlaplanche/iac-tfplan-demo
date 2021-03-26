terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region                  = "us-east-1"
  shared_credentials_file = ".aws/credentials"
}

variable "s3_acl" {
  type    = string
  default = "public-read-write"
}

resource "aws_s3_bucket" "pictures-of-snyky-dogs" {
  bucket = "pictures-of-snyky-dogs"
  acl    = var.s3_acl

  tags = {
    Name        = "Pictures of Snyky Dogs"
    Environment = "Production"
  }
}
