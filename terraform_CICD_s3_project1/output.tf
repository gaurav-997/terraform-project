# bucket URL
output "websiteendpoint" {
  value = aws_s3_bucket.s3_bucket.website_endpoint

}

# EC2 public IP 
output "public_ip" {
  value = aws_instance.gaurav.public_ip

}