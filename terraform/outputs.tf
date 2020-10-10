output "ec2_id" {
  value = aws_instance.EC2.id
}

output "rds_endpoint" {
  value = aws_db_instance.default.endpoint
}
