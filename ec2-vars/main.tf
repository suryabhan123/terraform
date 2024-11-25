resource "aws_key_pair" "suryavm" {
    key_name = "${var.tags.Name}-kp"
    public_key = file("/Users/surya/.ssh/id_rsa.pub")
}

resource "aws_instance" "suryavm" {
    ami = var.ami
    instance_type = var.instance_type
    tags = var.tags
    key_name = aws_key_pair.suryavm.key_name
}