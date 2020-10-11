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

### The Elastic IP for the Bastion
resource "aws_eip" "EIP" {
 vpc = true
 instance = aws_instance.jenkins.id
 associate_with_private_ip = aws_instance.jenkins.private_ip
 tags = {
  Name = "elastic-ip"
 }
}

resource "aws_default_subnet" "default_az1" {
  availability_zone = "eu-west-2c"

  tags = {
    Name = "Default subnet for eu-west-2c"
  }
}
resource "aws_db_instance" "RDStest" {
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
  db_subnet_group_name = "default-vpc-7e4f1b16"
  skip_final_snapshot  = true
  apply_immediately    = true
}
resource "aws_db_instance" "RDSprod" {
  identifier           = "prod-db"
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t2.micro"
  name                 = "prod_db"
  username             = "root"
  password             = "password"
  parameter_group_name = "default.mysql5.7"
  db_subnet_group_name = "default-vpc-7e4f1b16"
  skip_final_snapshot  = true
  apply_immediately    = true
}
