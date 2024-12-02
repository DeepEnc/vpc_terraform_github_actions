variable "vpc_cidr" {
    description = "VPC CIDR range"
    type = string  
}

variable "subnet_cidr" {
    description = "Subnet CIDR range"
    type = list(string)
}

variable "subnet_names" {
    description = "subnet names"
    type = list(string)
    default = ["PublicSubnet1", "PublicSubnet2"]
}