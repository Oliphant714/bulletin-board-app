resource "aws_s3_bucket" "bulletin_board" {
  bucket = var.bucket_name
}

resource "aws_s3_bucket_website_configuration" "bulletin_board" {
  bucket = aws_s3_bucket.bulletin_board.id

  index_document {
    suffix = "index.html"
  }
}

resource "aws_s3_bucket_public_access_block" "bulletin_board" {
  bucket = aws_s3_bucket.bulletin_board.id

  block_public_acls       = false
  block_public_policy     = false
  ignore_public_acls      = false
  restrict_public_buckets = false
}

resource "aws_s3_bucket_policy" "bulletin_board" {
  bucket = aws_s3_bucket.bulletin_board.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid       = "PublicReadGetObject"
        Effect    = "Allow"
        Principal = "*"
        Action    = "s3:GetObject"
        Resource  = "${aws_s3_bucket.bulletin_board.arn}/*"
      }
    ]
  })

  depends_on = [aws_s3_bucket_public_access_block.bulletin_board]
}

resource "aws_s3_object" "index" {
  bucket       = aws_s3_bucket.bulletin_board.id
  key          = "index.html"
  source       = "${path.module}/../app/index.html"
  etag         = filemd5("${path.module}/../app/index.html")
  content_type = "text/html"
}
