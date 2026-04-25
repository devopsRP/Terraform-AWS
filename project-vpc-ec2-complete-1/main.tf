# Creating VPC
resource "aws_vpc" "myvpc" {
  cidr_block = var.cidr
}

#creat in subnet
resource "aws_subnet" "sub1" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.1.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true

    tags = {
      Name ="sub1"
    }

  
}

resource "aws_subnet" "sub2" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "192.168.2.0/24"
    availability_zone = "us-east-1b"
    map_public_ip_on_launch = true

      tags = {
      Name ="sub2"
    }
    
  
}

#creating Internate gateway

resource "aws_internet_gateway" "IGW" {
    vpc_id = aws_vpc.myvpc.id
  
}

#creating route table

resource "aws_route_table" "RT" {
    vpc_id = aws_vpc.myvpc.id

    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.IGW.id
    }
  
}

#creating subnet association

resource "aws_route_table_association" "rta1" {
    subnet_id = aws_subnet.sub1.id
    route_table_id = aws_route_table.RT.id
  
}

resource "aws_route_table_association" "rta2" {
    subnet_id = aws_subnet.sub2.id
    route_table_id = aws_route_table.RT.id
  
}

#creating security group

resource "aws_security_group" "webSg" {
    name = "web"
    vpc_id = aws_vpc.myvpc.id


    ingress {
        description= "HTTP from vpc"
        from_port = 80
        to_port = 80
        protocol ="tcp"
        cidr_blocks =["0.0.0.0/0"]

    }

    ingress {
        description = "SSH"
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

     }

     egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]

     }

     tags ={
        Name ="Web-sg"
     }
  
}

#creating S3 bucket

resource "aws_s3_bucket" "s3-bucket" {
    bucket = "terra-s3-test-rp-project"

  
}

#creating ec2 insatance with VPC

resource "aws_instance" "webserver1" {
    ami = "ami-098e39bafa7e7303d"
    instance_type = "t3.micro"
    key_name = "terrakey"
    vpc_security_group_ids = [aws_security_group.webSg.id]
    subnet_id = aws_subnet.sub1.id

    user_data = file("userdata1.sh")

    tags = {
      Name ="webserver-1"
    }
  
}


resource "aws_instance" "webserver2" {
    ami = "ami-098e39bafa7e7303d"
    instance_type = "t3.micro"
    key_name = "terrakey"
    vpc_security_group_ids = [aws_security_group.webSg.id]
    subnet_id = aws_subnet.sub2.id

    user_data = file("userdata.sh")


     tags = {
      Name ="webserver-2"
    }
  
}

#creating load balancer

resource "aws_lb" "myalb" {
    name = "myalb"
    internal = false
    load_balancer_type = "application"
    security_groups = [aws_security_group.webSg.id]
    subnets = [aws_subnet.sub1.id, aws_subnet.sub2.id]

    tags = {
     Name = "web" 
    }
  
}


resource "aws_lb_target_group" "tg" {
    name = "my-tg"
    port = 80
    protocol = "HTTP"
    vpc_id = aws_vpc.myvpc.id

    health_check {
      path = "/"
      port = "traffic-port"
    }
  
}

#attaching load balancer
resource "aws_lb_target_group_attachment" "attach1" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.webserver1.id
    port = 80
  
}

resource "aws_lb_target_group_attachment" "attach2" {
    target_group_arn = aws_lb_target_group.tg.arn
    target_id = aws_instance.webserver2.id
    port = 80
  
}

resource "aws_lb_listener" "listener" {
    load_balancer_arn = aws_lb.myalb.arn
    port = 80
    protocol = "HTTP"

    default_action {
      target_group_arn = aws_lb_target_group.tg.arn
      type = "forward"
    }
  
}

output "lodbalancerdns" {
    value = aws_lb.myalb.dns_name
  
}

output "public_ip_webserver1" {
    value = aws_instance.webserver1.public_ip
  
}

output "public_ip_webserver2" {
    value = aws_instance.webserver2.public_ip
  
}
