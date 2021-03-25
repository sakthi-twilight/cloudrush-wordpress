output "dev_ec2_public_ip" {
  value       = aws_eip.dev_wordpress_ec2_eip.public_ip
  description = "The Elastic Public IP of Dev EC2 Instance"
}

output "dev_ec2_private_ip" {
  value       = aws_instance.dev_wordpress_ec2.private_ip
  description = "The Private IP of Dev EC2 Instance"
}

output "prod_ec2_public_ip" {
  value       = aws_eip.prod_wordpress_ec2.public_ip
  description = "The Elastic Public IP of Prod EC2 Instance"
}

output "dev_ec2_private_ip" {
  value       = aws_instance.prod_wordpress_ec2.private_ip
  description = "The Private IP of Prod EC2 Instance"
}