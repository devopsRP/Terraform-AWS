terraform {
  backend "s3" {
    bucket = "s3-remote-backend-26"
    key    = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "remote"   # state locking
  }
required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "6.3.0"
    }
  }

}

provider "aws" {
    region = "us-east-1"
  
}


resource "aws_vpc" "my_vpc" {
    cidr_block = "10.0.0.0/16"
  
}

