
// Security Group for ALB
resource "aws_security_group" "alb" {
  vpc_id        = var.vpc_id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {Name  = "Test"}
}
// Create the ALB
resource "aws_alb" "main-alb" {
  security_groups     = [aws_security_group.alb.id]
  subnets             = var.public_subnets
  internal            = false
  load_balancer_type  = "application"
  tags = {Name        = "Test"}
}

resource "aws_lb_target_group" "tg-test" {
  name        = "tg-test"
  port        = 80
  protocol    = "HTTP"
  target_type = "instance"
  vpc_id      = var.vpc_id
}

resource "aws_lb_listener" "listener_test" {
  load_balancer_arn = aws_alb.main-alb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.tg-test.arn
  }
}