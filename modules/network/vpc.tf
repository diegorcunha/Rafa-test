resource "aws_vpc" "VPC" {
  cidr_block           = var.cidr
  instance_tenancy = "default"
  enable_dns_hostnames = var.enable_dns_hostnames
  enable_dns_support   = var.enable_dns_support
  tags                 = {Name = "Test"}
}