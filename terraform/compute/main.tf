resource "aws_launch_template" "app" {
  name          = "web-app-template"
  image_id      = var.ami_id
  instance_type = var.instance_type

  vpc_security_group_ids = [var.ec2_sg_id]

  iam_instance_profile {
    name = var.iam_profile_name
  }

user_data = base64encode(file("${path.module}/../application/user-data.sh"))
}
resource "aws_autoscaling_group" "asg" {
  name                = "web-asg"
  max_size            = 3
  min_size            = 1
  desired_capacity    = 2
  vpc_zone_identifier = var.private_subnets

  launch_template {
    id      = aws_launch_template.app.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]

  health_check_type         = "EC2"
  health_check_grace_period = 300
}

