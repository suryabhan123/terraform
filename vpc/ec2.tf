resource "aws_instance" "test1" {
    ami = "ami-0d7a109bf30624c99"
    instance_type = "t2.micro"
    key_name = "awsec2"
    subnet_id = "subnet-0d97175a927241cd4"

tags = {
    Name = "app1"
    Env = "dev"
}
  
}