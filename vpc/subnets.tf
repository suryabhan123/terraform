resource "aws_subnet" "public_subnets" {
    count = length(var.public_subnets)
    vpc_id = aws_vpc.demo.id
    cidr_block = element(var.public_subnets, count.index)
    availability_zone = element(var.azn, count.index)
    map_public_ip_on_launch = true

    tags = {
        Name = "Public subnet ${count.index + 1}"
    }
  
}

resource "aws_subnet" "private_subnets" {
    count = length(var.private_subnets)
    vpc_id = aws_vpc.demo.id
    cidr_block = element(var.private_subnets, count.index)
    availability_zone = element(var.azn, count.index)

    tags = {
        Name = "Private subnet ${count.index + 1}"
    }
  
}