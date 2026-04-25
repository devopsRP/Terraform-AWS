resource "aws_vpc" "vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
     Name = "my_vpc"
    }
  
}

resource "aws_subnet" "implicit-subnet" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"

    tags = {
     Name = "subnet-implicit" 
    }
  
}