output "rds_endpoint" {
  description = "RDS database endpoint"
  value       = aws_db_instance.rds_creation.endpoint
}