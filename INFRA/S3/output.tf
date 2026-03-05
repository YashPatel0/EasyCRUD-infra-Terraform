# Output the bucket's website endpoint
output "website_endpoint" {
  value       = aws_s3_bucket.pranav.website_endpoint
  description = "The URL to access the static website"
}