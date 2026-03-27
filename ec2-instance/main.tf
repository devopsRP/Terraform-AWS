resource "aws_instance" "auto-ec2" {
    ami = "ami-0f559c3642608c138"
    
    instance_type = "t3.micro"
  

 
  tags = {
    Name = "terra-auto-ec2"
  }
}