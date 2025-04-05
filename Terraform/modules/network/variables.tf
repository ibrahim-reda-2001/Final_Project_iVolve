variable "vpc-cidr" {
  type        = string
  default     = "10.0.0.0/16"
  description = "cidr block for vpc"
}
variable "public-subnet-cidr"{
    type = string
    default = "10.0.1.0/24"
    description = "public subnet cidr"
    }
variable "az"{
    type = string
    default = "us-east-1a"
    description = "Availability zone"
    
}   

variable "enviroment"{
    description = "Environment tag"
  type        = string
  default     = "prod"
}
