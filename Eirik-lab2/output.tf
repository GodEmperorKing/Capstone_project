output "ip_address" {
  value = aws_instance.fortressmaximus-ec2.public_ip
}

output "website_url" {
  value = "http://${aws_instance.fortressmaximus-ec2.public_dns}" 
}