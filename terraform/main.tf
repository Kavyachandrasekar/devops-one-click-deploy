module "networking" {
  source = "./networking"
}

module "security" {
  source = "./security"
  vpc_id = module.networking.vpc_id
}

module "loadbalancer" {
  source = "./loadbalancer"

  vpc_id                 = module.networking.vpc_id
  public_subnet_ids      = module.networking.public_subnet_ids
  alb_security_group_id  = module.security.alb_sg_id
  target_port            = 8080
}

module "compute" {
  source            = "./compute"

  ami_id            = var.ami_id
  instance_type     = "t2.micro"
  private_subnets   = module.networking.private_subnet_ids
  ec2_sg_id         = module.security.ec2_sg_id
  target_group_arn  = module.loadbalancer.target_group_arn
  iam_profile_name = module.security.ec2_instance_profile_name
}

output "alb_dns_name" {
  value = module.loadbalancer.alb_dns
}

