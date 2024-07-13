output "ec2_public_ip" {
    value = aws_instance.teju.public_ip
    description = "print the value of public ip"
  
}

output "ec2_private_ip" {
    value = aws_instance.teju.private_ip
    description = "print the value of private ip"
    sensitive = true
}

output "private_ip" {
    value = aws_instance.test.private_ip
    description = "print the value of private ip"
    sensitive = true
}