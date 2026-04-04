
#VPC

resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    
   tags = {
    Name ="my-vpc"

   } 

  
}

#SUBNET

resource "aws_subnet" "my-subnet" {
    
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"
  
  tags = {
    Name ="my-subnet-pub"
  }


}
