# Using default VPC
data "aws_vpc" "rds_vpc" {
  default = true
}

# Using Dafault subnet
data "aws_subnets" "rds_subnet" {
  filter {
    name   = "vpc-id"
    values = [data.aws_vpc.rds_vpc.id]
  }
}


# Security group for RDS

resource "aws_security_group" "rds_security" {
    vpc_id = data.aws_vpc.rds_vpc.id
    ingress {
        from_port = 3306
        to_port = 3306
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        name = "RDS_security_group"
    }
}


# Subnet group for RDS
resource "aws_db_subnet_group" "rds_subne_group_my" {
  name       = "db-subnet-group"
  subnet_ids = data.aws_subnets.rds_subnet.ids
  tags = {
    Name        = "db-subnet-group"
  }
}


# Creating RDS
resource "aws_db_instance" "rds_creation" {
  allocated_storage    = var.allocated_storage 
  max_allocated_storage = var.max_allocated_storage 
  db_name              = "my_database"
  engine               = "mysql"
  engine_version       = "8.0"
  instance_class       = var.instance_class
  username             = var.username  
  password             = var.password
  parameter_group_name = "default.mysql8.0"
  publicly_accessible     = false
  skip_final_snapshot  = false
  final_snapshot_identifier = "mydb-final-snapshot"
  vpc_security_group_ids = [aws_security_group.rds_security.id]
  db_subnet_group_name = aws_db_subnet_group.rds_subne_group_my.name
  tags = {
    Name = "RDS-db-instance"
  }
}