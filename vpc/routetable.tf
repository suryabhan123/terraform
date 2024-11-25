resource "aws_route_table" "public_rt" {
    vpc_id = aws_vpc.demo.id

    tags = {
      Name = "public route table"
    }
  
}

resource "aws_route_table" "private_rt" {
    vpc_id = aws_vpc.demo.id

    tags = {
      Name = "private route table"
    }
  
}

resource "aws_route_table_association" "public_subnets_association" {
    count = length(var.public_subnets)
    subnet_id = element(aws_subnet.public_subnets[*].id, count.index)
    route_table_id = aws_route_table.public_rt.id
  
}

resource "aws_route_table_association" "private_subnets_association" {
    count = length(var.private_subnets)
    subnet_id = element(aws_subnet.private_subnets[*].id, count.index)
    route_table_id = aws_route_table.private_rt.id
  
}
