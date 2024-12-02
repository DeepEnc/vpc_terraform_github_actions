variable "vpc_cidr" {
    description = "VPC CIDR range"
    type = string  
}

variable "subnet_cidr" {
    description = "Subnet CIDR range"
    type = list(string)
}