resource "aws_vpc" "demo" {
    cidr_block = "192.168.200.0/24"
    enable_dns_hostnames = true

  tags = {
    Name = "Demo-vpc"
    Env = "dev"
  }
  
}

