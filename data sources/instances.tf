resource "aws_instance" "roboshop" {
  ami           = data.aws_ami.my_ami.id
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]
  

  tags = {
    Name = "example"
  }
}

resource "aws_security_group" "allow_all_ip" {
  name        = "allow_all_ip"
  description = "Allow all inbound traffic and all outbound traffic"
 
  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

    egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = "allow_all_ip"
  }
}

