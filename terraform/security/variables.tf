variable "vpc_id" {
  description = "VPC ID from networking module"
}

variable "app_port" {
  default     = 8080
  description = "Application port for EC2 instance"
}

