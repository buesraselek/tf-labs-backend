#RESOURCE "RESOURCE_TYPE" "RESOURCE_NAME"
resource "aws_s3_bucket" "ta_backend_bucket" {
  bucket = "ta-terraform-tfstates-535268269273"

#META-DATA
lifecycle {
      prevent_destroy = true
    }

    tags = {
        Name = "ta-terraform-tfstates-535268269273"
        Environment = "Test"
        Team = "Talent-Academy"
        Name = "Busra"
    }
}
resource "aws_s3_bucket_versioning" "version_my_bucket" {
  bucket = aws_s3_bucket.ta_backend_bucket.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_dynamodb_table" "terraform_lock_tbl" {
  name           = "terraform-lock"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags           = {
    Name = "terraform-lock"
  }
}
