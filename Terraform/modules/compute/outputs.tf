
output "instance_public_ips" {
  value = aws_instance.public[*].public_ip
}

