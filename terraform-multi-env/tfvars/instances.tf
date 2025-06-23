resource "aws_instance" "roboshop" {
  count = length(var.instances)
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]


  tags = merge( var.common_Tags,
  {
    Name = "${var.project}-${var.instances[count.index]}-${var.environment}"
  }
  )
  
}

resource "aws_security_group" "allow_all_ip" {
  name        = "${var.sg_name}-${var.environment}"
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
  tags = merge(var.common_Tags, var.sg_tag_name)

}

