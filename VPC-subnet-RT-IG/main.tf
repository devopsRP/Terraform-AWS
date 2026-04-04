
#vpc block
resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"

    tags = {
      Name ="auto-vpc"
    }
    
  
}

#subnet block
resource "aws_subnet" "public-subnet" {
    vpc_id = aws_vpc.my-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1a"


    tags = {
        Name ="public-subnet"
    }
  
}

#Route table 
resource "aws_route_table" "rt" {
    vpc_id = aws_vpc.my-vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IG.id
    }

    tags = {
      Name ="vpc-rt" 
    }
  
}

#internet-Gateway
resource "aws_internet_gateway" "IG" {

    vpc_id = aws_vpc.my-vpc.id

      tags = {
    Name = "main"
  }
  
}

#Route table association
resource "aws_route_table_association" "rt-asso" {
    subnet_id = aws_subnet.public-subnet.id
    route_table_id = aws_route_table.rt.id
  
}