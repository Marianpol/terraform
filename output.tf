output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.id
}

output "instance_public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.example.public_ip
}

output "security_group_id" {
  description = "Id of security group"
  value       = aws_security_group.allow_http.id
}

output "bucket_id" {
  description = "ID of S3 bucket"
  value       = aws_s3_bucket.ci-bucket.id
}