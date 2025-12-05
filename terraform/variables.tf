variable "aws_region" {
  type        = string
  default     = "ap-south-1"
}

variable "ami_id" {
  type        = string
  description = "AMI ID for EC2 instance"
}

variable "iam_profile_name" {
  type        = string
  description = "IAM instance profile name"
}

