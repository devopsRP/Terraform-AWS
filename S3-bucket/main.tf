resource "aws_s3_bucket" "s3bucket" {
    
    bucket = "my-s3-bucket-r130998"   # bucket should be globally unique name 

   tags = {
     name ="My-Terraform-Bucket"

   }
  
}
  
