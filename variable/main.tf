resource "aws_instance" "EC2-a" {
     instance_type = var.instance_type

     ami = "ami-0ea87431b78a82070"
     

     tags ={
          Name = var.instance_name
     }   

}



  


