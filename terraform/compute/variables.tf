variable "ami_id" { default= "ami-00d2efe5bc0683614"}
variable "instance_type" { default = "t2.micro" }
variable "private_subnets" { type = list(string) }
variable "ec2_sg_id" { type = string }
variable "target_group_arn" { type = string }
variable "iam_profile_name" {  default = "EC2-Access-Role"}

