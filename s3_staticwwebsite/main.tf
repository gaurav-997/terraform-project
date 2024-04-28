# creating bucket 
resource "aws_s3_bucket" "projectbucket" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = aws_s3_bucket.projectbucket.id

  rule {
    object_ownership = "BucketOwnerPreferred"
  }
}

# providing public access to bucket 
resource "aws_s3_bucket_public_access_block" "example" {
  bucket                  = aws_s3_bucket.projectbucket.id
  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_acl" "example" {
  depends_on = [
    aws_s3_bucket_ownership_controls.example,
    aws_s3_bucket_public_access_block.example,
  ]

  bucket = aws_s3_bucket.projectbucket.id
  acl    = "public-read"
}

# uploading a file to the bucket we use objects 

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.projectbucket.id
  key          = "index.html"
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_object" "error" {
  bucket       = aws_s3_bucket.projectbucket.id
  key          = "error.html"
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}


# hosting the website via S3
resource "aws_s3_bucket_website_configuration" "example" {
  bucket = aws_s3_bucket.projectbucket.id
  index_document {
    suffix = "index.html"
  }
  error_document {
    key = "error.html"
  }
}
