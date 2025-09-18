terraform {
  backend "s3" {
    bucket = "demo-jenkins-server-backup"
    region = "ap-south-1"
    key = "eks/terraform.tfstate"
  }
}