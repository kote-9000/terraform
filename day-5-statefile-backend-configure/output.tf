output "ec2_public_ip" {
    value = aws_instance.name.public_ip
    description = "to print public ip values"
  
}