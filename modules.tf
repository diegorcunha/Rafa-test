// Module used to create all the network environment.
module "network" {
  source          = "./modules/network"
  name            = var.name
  cidr            = var.cidr
  public_subnets  = var.public_subnets
  private_subnets = var.private_subnets
  azs             = var.azs
}

// Module used to create the ELB
module "alb" {
  source         = "./modules/alb"
  public_subnets = module.network.public_subnets
  vpc_id         = module.network.vpc_id
  name           = var.name
  azs            = var.azs
}

// Module used to create the EC2
module "ec2" {
  source = "./modules/ec2"
  aws_region          = var.aws_region
  aws_alb             = module.alb.aws_alb
  vpc_id              = module.network.vpc_id
  private_subnets     = module.network.private_subnets
  name                = var.name
  azs                 = var.azs
  values_min          = var.values_min
  amis                = var.amis
  key_name            = var.key_name
  values_max          = var.values_max
  aws_lb_target_group = module.alb.aws_lb_target_group
}

