provider "aws" {
    profile = "studio_mfa"
    region = "us-east-1"
}

resource "aws_instance" "terraformExample" {
    ami = "ami-00952af15c15da0ba"
    instance_type = "t2.micro"
}