variable "public_subnets" {
    type = list(string)
    description = "public_subnet_cidrs"
    default = [ "192.168.200.0/26", "192.168.200.64/26" ]
  
}

variable "private_subnets" {
    type = list(string)
    description = "private_subnet_cidrs"
    default = [ "192.168.200.128/26", "192.168.200.192/26" ]
  
}

variable "azn" {
    type = list(string)
    description = "availability zone"
    default = [ "us-east-1b", "us-east-1c" ]
  
}
