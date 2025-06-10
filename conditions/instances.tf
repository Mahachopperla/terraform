resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.Environment == "dev" ? "t2.nano" : "t2.micro" # it's a condition . if expression true t2.nano will be returned. if false then t2.micro will be returned.
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]
  

  tags = var.tag_name
}

resource "aws_security_group" "allow_all_ip" {
  name        = var.sg_name
  description = var.sg_description
 
  ingress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }

    egress {
    from_port        = var.from_port
    to_port          = var.to_port
    protocol         = "-1"
    cidr_blocks      = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = var.sg_tag_name
  
}

