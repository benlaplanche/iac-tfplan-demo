# terraform {
#   required_providers {
#     aws = {
#       source  = "hashicorp/aws"
#       version = "~> 3.0"
#     }
#   }
# }

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "3.26.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "3.0.1"
    }
  }
  required_version = "~> 0.14"

  backend "remote" {
    organization = "benlaplanche"

    workspaces {
      name = "gh-actions-demo"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
  # shared_credentials_file = ".aws/credentials"
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
