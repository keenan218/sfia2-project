provider "aws" {
  version                 = "~> 2.0"
  region                  = "eu-west-2"
  shared_credentials_file = "~/.aws/credentials"
}

resource "aws_instance" "EC2" {
  ami           = var.ami-id
  instance_type = var.instance-type
  key_name      = var.pem-key
}

resource "aws_db_instance" "RDS" {
  identifier           = "test-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "test_db"
  username             = "root"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  subnet_ids = ["subnet-009bc569", "subnet-6488121e", "subnet-cd1ab381]
  skip_final_snapshot  = true
  apply_immediately    = true
}

