output "alb" {
  description = "The DNS of the Loadbalance to access the application"
  value       = module.alb.aws_alb_dns
}

output "VPC_Id" {
  description = "The VPC ID used in this environment"
  value       = module.network.vpc_id
}

output "Public_Subnet" {
  description = "The Public Subnet used to access the internet"
  value       = module.network.public_subnets
}

output "Private_Subnet" {
  description = "The Private Subnet used to create EC2"
  value       = module.network.private_subnets
}

output "EIP" {
  description = "The EIP used to connect the public and private Subnet"
  value       = module.network.nat_eips_id
}

