provider "aws" {
  region = var.region
}

resource "aws_s3_bucket" "app_bucket" {
  bucket = var.bucket_name
  force_destroy = true

  tags = {
    Name        = "PatientCare App Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "jar_upload" {
  bucket = aws_s3_bucket.app_bucket.id
  key    = var.s3_object_key                    # 👈 Object name in S3
  source = var.local_jar_path                   # 👈 Local file path
  etag   = filemd5(var.local_jar_path)
  content_type = "application/java-archive"
}

