variable "vpc_id" {}
variable "public_subnet_ids" {
  type = list(string)
}

variable "alb_security_group_id" {}
variable "target_port" {
  default = 8080
}

