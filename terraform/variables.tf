variable "ami-id" {
  description = "AMI ID of ubuntu 18.04LTS eu-west-2"
  default     = "ami-09a1e275e350acf38"
}

variable "instance-type" {
  description = "Free tier EC2 Instance type"
  default     = "t2.micro"
}

variable "pem-key" {
  description = "Associated Key to SSH into the EC2 Instance"
  default     = "terraform-keys"
}

variable "security-group" {
  description = "Security group to give ssh, mysql, 80 and 8080 ports"
  default     = ["vpc-7e4f1b16", ]
}
