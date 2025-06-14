resource "aws_instance" "roboshop" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]
  
# in local- exec we can write whatever we wanted to perform in local server while executing terraform file.

   provisioner "local-exec" {
    command = "echo ${self.private_ip} >> inventory.ini"
  }

# and also we have 2 types of provisioners 
 
#  i) creation time provisioners
#  ii)destroy time provisioners
 
#  by default the provisioners which we use will work during creating infra.
 
#  but if we want some actions to be performed while destryoing infra we can specify them in provisioners as,
 
#  when = destroy
 
# so it will run that particular provisioner while destroying.

   provisioner "local-exec" {
    command = "echo 'we are destructing infra'"
    when = destroy
    on_failure = continue #ignoring errors -> this will tell terraform that even if this block code fails , continue script execution.
	
  }

# for example you know you are creating multiple frontend servers and they need nginx inside it.

# so instaed of creating servers and then going for configuration. we can simply do it while creation time only using remote-exec.

# now to create configuration we need access to connect to servers created.

# so first establicsh a connection and then write remote exec,

connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "sudo systemctl stop nginx"
    ]
    when = destroy
  }



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

