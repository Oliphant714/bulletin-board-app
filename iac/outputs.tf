output "website_url" {
  description = "URL of the deployed bulletin board app"
  value       = aws_s3_bucket_website_configuration.bulletin_board.website_endpoint
}

output "bucket_name" {
  description = "Name of the S3 bucket hosting the app"
  value       = aws_s3_bucket.bulletin_board.id
}
