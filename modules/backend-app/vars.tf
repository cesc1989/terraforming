variable "server_port" {
  description = "Server port for EC2 instances"
}

variable "aws_region" {
  description = "AWS region to launch instances in"
}

variable "environment" {
  description = "Environment servers belong to"
}

variable "instance_type" {
  default = "The machine instance type to use"
}
