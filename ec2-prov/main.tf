resource "aws_key_pair" "suryavm" {
    key_name = "${var.tags.Name}-kp"
    public_key = file("/Users/surya/.ssh/id_rsa.pub")
}

resource "aws_instance" "suryavm" {
    ami = var.ami
    instance_type = var.instance_type
    tags = var.tags
    key_name = aws_key_pair.suryavm.key_name

provisioner "local-exec" {
    command = "echo ${self.public_ip} > myipfile"
}

provisioner "local-exec" {
    command = "echo sudo yum install httpd -y > myscript.sh ; echo sudo systemctl restart httpd >> myscript.sh"
}

provisioner "file" {
    source = "myscript.sh"
    destination = "/tmp/myscript.sh"
    connection {
        type = "ssh"
        user = "ec2-user"
        private_key = file("/Users/surya/.ssh/id_rsa")
        host = self.public_ip
    }
}

provisioner "remote-exec" {
    inline = [ 
        "chmod 755 /tmo/myscript.sh",
        "/bin/sh /tmp/myscript.sh"
     ]
     connection {
       type = "ssh"
       user = "ec2-user"
       private_key = file("/Users/surya/.ssh/id_rsa")
       host = self.public_ip
     }
 }
}