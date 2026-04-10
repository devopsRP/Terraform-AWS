output "public_ip_ec2" {
    value = aws_instance.EC2-a.public_ip
  
}
output "private_ip_ec2" {
    value = aws_instance.EC2-a.private_ip
  
}

output "complete_info_ec2" {
    value = aws_instance.EC2-a
  
}