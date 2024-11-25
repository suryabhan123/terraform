resource "aws_instance" "test1" {
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    subnet_id = "subnet-0218d4bcd5f4f8364"
    key_name = "awsec2"

    tags = {
      Name = "test"
      Env = "dev"
    }
  
}

resource "aws_security_group" "iac-sg" {
    name = "iac-sg-group"
    description = "iac-sg-group"
    vpc_id = "vpc-0c9c06472a1220ab8"

    # allow port 22
    ingress = {
        from_port = 22
        protocol = "tcp"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }
    # # # allow port 80
    # ingress = {
    #     from_port = 80
    #     protocol = ""
    #     to_port = 80
    #     cidr_blocks = ["0.0.0.0/0"]
 #  }
    egress = {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
  
}