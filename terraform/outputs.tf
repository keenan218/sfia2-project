output "ec2_id" {
  value = aws_instance.EC2.id
}

output "rds_test_endpoint" {
  value = aws_db_instance.RDStest.endpoint
}

output "rds_prod_endpoint" {
  value = aws_db_instance.RDSprod.endpoint
}
