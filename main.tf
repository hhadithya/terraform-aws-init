terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  required_version = ">= 1.3.0"
}

provider "aws" {
  region = "ap-southeast-1"
}

resource "aws_s3_bucket" "bucket-init-test" {
  # S3 bucket names must be globally unique across ALL of AWS.
  bucket =  "terraform-bucket-init-hh-2025-06-02"

  # Add tags, which is a best practice
  tags = {
    Name = "TerraformBucket"
    Project = "TerraformAwsInit"
    Owner = "hhadithya"
  }
}