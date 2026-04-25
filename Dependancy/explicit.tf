
#vpc created in Implicit file

resource "aws_subnet" "explicit-subnet" {
    depends_on = [ aws_vpc.vpc]
   vpc_id = "vpc"
    cidr_block = "10.0.1.0/24"
    availability_zone = "ap-south-1b"

    tags = {
     Name = "explicit-subnet"
    }
  
}