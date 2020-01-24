output "aws_alb" {
  value = aws_alb.main-alb.id
}

output "aws_alb_dns" {
  value = aws_alb.main-alb.dns_name
}

output "aws_lb_target_group" {
  value = aws_lb_target_group.tg-test
}
