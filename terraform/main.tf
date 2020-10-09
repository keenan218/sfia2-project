provider "aws" {
    version = "~> 2.0"
    region = "eu-west-1"
    shared_credentials_file = "~/.aws/credentials"
}

resource "aws_instance" "EC2" {
  ami           = var.ami-id
  instance_type = var.instance-type
  key_name      = var.pem-key
}

