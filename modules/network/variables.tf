variable "name" {
}

variable "cidr" {
}

variable "public_subnets" {
}

variable "private_subnets" {
}

variable "azs" {
}

variable "enable_dns_hostnames" {
  default     = true
}

variable "enable_dns_support" {
  default     = true
}

variable "enable_nat_gateway" {
  default     = true
}

variable "map_public_ip_on_launch" {
  default     = true
}

variable "private_propagating_vgws" {
  default     = []
}

variable "public_propagating_vgws" {
  
  default     = []
}

variable "tags" {
  default     = {}
}
