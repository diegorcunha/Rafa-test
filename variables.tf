variable "aws_region" {
  type        = string
  default     = "us-east-1"
  description = "Define the region wherer this terraform will create the envrionment"
}

variable "aws_access_key" {
  type        = string
  default     = ""
  description = "Access_key for create the environment."
}

variable "aws_secret_key" {
  type        = string
  default     = ""
  description = "Secret_key for create the environment."
}

variable "name" {
  default     = "test"
  description = "Variable usad to create a tag name"
}

variable "cidr" {
  default = "192.168.0.0/22"
}

variable "public_subnets" {
  type    = list(string)
  default = ["192.168.2.0/24", "192.168.3.0/24"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["192.168.0.0/24"]
}

variable "azs" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b"]
}

variable "values_min" {
  default     = 2
  description = "Number minimum initial to create of the EC2"
}

variable "values_max" {
  default     = 10
  description = "Number maximum initial to create with the ASG"
}

variable "amis" {
  description = "Base AMI to launch the instances"
  default = {
    us-east-1 = "ami-40d28157"
  }
}

variable "key_name" {
  description = "Key name for SSH into EC2"
  default     = "devops-east-1"
}

