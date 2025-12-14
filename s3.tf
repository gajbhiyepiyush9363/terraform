#main.terraform 

terraform {
  backend "s3" {
    bucket = "samterra45aws"
    key    = "terraform.tfstate"
    region = "ap-south-1"

  }
}

provider "aws" {

    region = "ap-south-1"

}



resource "aws_instance" "my_instacne" {
   ami = "ami-02b8269d5e85954ef"
   instance_type = "t3.micro"
   subnet_id = "subnet-093434380a6d5b8a3"
    tags = {
        Name = "MyFirstInstance"
        env = "prod"
    }
}
