provider "aws" {
    region = "us-east-1"
}

resource "aws_s3_bucket" "tf_state" {
    bucket = "adex_terraform_9842463240"
}

resource "aws_s3_bucket_versioning" "tf_state" {
    bucket = aws_s3_bucket.tf_state.id   

    versioning_configuration {
      status = "Disabled"
    }
}

resource "aws_s3_bucket_public_access_block" "tf_state" {
    bucket = aws_s3_bucket.tf_state.id 

    block_public_acls = true 
    block_public_policy = true 
    ignore_public_acls = true 
    restrict_public_buckets = true 
}
