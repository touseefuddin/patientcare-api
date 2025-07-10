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

resource "aws_s3_bucket" "app_config_bucket" {
  bucket = var.config_bucket_name
  force_destroy = true

  tags = {
    Name        = "PatientCareConfigBucket"
    Environment = "Dev"
  }
}

resource "aws_s3_object" "app_properties" {
  bucket       = aws_s3_bucket.app_config_bucket.id
  key          = "application.properties"
  source       = "C:\\Users\\khaja\\external-config\\application.properties"  # Adjust path accordingly
  content_type = "text/plain"
}
