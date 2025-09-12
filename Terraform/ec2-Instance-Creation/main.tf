provider "aws" {
  region = "us-east-1"

}

resource "aws_instance" "my-Ec2" {

    ami = "ami-0b09ffb6d8b58ca91"
    instance_type = "t2.micro"
  
  tags = {
    Name = "demo-Ec2"
    env = "tesing"
  }
}