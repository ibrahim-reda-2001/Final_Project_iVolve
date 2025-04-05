# Network variables
variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "az" {
  type    = string
  default = "us-east-1a"
}

# Compute variables
variable "ami" {
  type    = string
  default = "ami-084568db4383264d4"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
}

variable "instance_count" {
  type    = number
  default = 2
}

