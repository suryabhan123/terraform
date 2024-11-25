terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.75.1"
    }
  }
}

resource "aws_instance" "suryavm" {
    ami = "ami-08bf489a05e916bbd"
    instance_type = "t2.micro"

    tags = {
        Name = "suryavm"
    }
  
}

resource "aws_ebs_volume" "suryavm1" {
  availability_zone = "ap-south-1a"
  size = 1

  tags = {
    Name = "suryavm"
  }
  
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdb"
  volume_id = aws_ebs_volume.suryavm1.id
  instance_id = aws_instance.suryavm.id
  
}