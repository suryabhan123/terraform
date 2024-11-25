variable "aws" {
    type = map 
    default = {
        region = "ap-south-1"
    }
}

variable "ami" {
    default = "ami-08bf489a05e916bbd"
}

variable "instance_type" {
    default = "t2.micro"
}

variable "tags" {
    default = {
        Name = "suryavm"
    }
}