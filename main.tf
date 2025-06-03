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
  bucket = "terraform-bucket-init-hh-2025-06-02"

  # Add tags, which is a best practice
  tags = {
    Name    = "TerraformBucket"
    Project = "TerraformAwsInit"
    Owner   = "TerraformOperator"
  }
}

resource "aws_s3_bucket_public_access_block" "bucket-init-test_public_access_block" {
  # Reference the bucket ID
  bucket = aws_s3_bucket.bucket-init-test.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}

output "bucket_name" {
  description = "Name of the S3 bucket"

  value = aws_s3_bucket.bucket-init-test.id
}

output "bucket_arn" {
  description = "ARN of the S3 bucket"

  value = aws_s3_bucket.bucket-init-test.arn
}