resource "aws_instance" "roboshop" {
  count = length(var.instances)
  ami                    = var.ami_id

# ->we have special varialbe in terraform workspace
# 			terraform.workspace
			
# the value of this variable will depend on the environement workspace we are in.

# if we are in dev workspace then terraform.workspace=dev
# if we are in prod workspace then terraform.workspace=prod

  instance_type          = lookup(var.instance_type, terraform.workspace)
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]


  tags = merge( var.common_Tags,
  {
    Name = "${var.project}-${var.instances[count.index]}-${terraform.workspace}"
  }
  )
  
}

resource "aws_security_group" "allow_all_ip" {
  name        = "${var.sg_name}-${terraform.workspace}"
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

