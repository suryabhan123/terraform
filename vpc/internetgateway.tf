resource "aws_internet_gateway" "demo-gw" {
    vpc_id = aws_vpc.demo.id

    tags = {
      Name = "My demo IGW"
    }
  
}