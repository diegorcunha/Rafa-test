
// Creating Security Group for EC2
resource "aws_security_group" "instance" {
  vpc_id      = var.vpc_id
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {Name = "test"}
}

// Creating Launch Configuration
resource "aws_launch_configuration" "launch_config" {
  name                   = "launch_config"
  image_id               = lookup(var.amis,var.aws_region)
  instance_type          = "t2.micro"
  security_groups        = [aws_security_group.instance.id]
  key_name               = var.key_name
  user_data = <<-EOF
              #!/bin/bash
              echo "Hello World !!!" > index.html
              nohup busybox httpd -f -p 80 &
              EOF
  lifecycle {
    create_before_destroy = true
  }
}
// Creating AutoScaling Group
resource "aws_autoscaling_group" "autoscaling_group" {
  launch_configuration          = "launch_config"
  min_size                      = var.values_min
  max_size                      = var.values_max
  target_group_arns             = [var.aws_lb_target_group.id]
  vpc_zone_identifier           = var.private_subnets
  health_check_type             = "ELB"
  tag {
    key = "name"
    value = "autoscaling-test"
    propagate_at_launch = true
  }
}
