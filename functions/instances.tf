resource "aws_instance" "roboshop" {
  count = 2
  ami                    = var.ami_id
  instance_type          = var.Environment == "dev" ? "t2.nano" : "t2.micro" # it's a condition . if expression true t2.nano will be returned. if false then t2.micro will be returned.
  vpc_security_group_ids = [aws_security_group.allow_all_ip.id]


  tags = merge( var.common_Tags,
  {
    Name = var.instances[count.index]
  }
  )
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
  tags = merge( var.common_Tags, var.sg_tag_name )

}



# You want to combine:

# Common tags from var.common_Tags like:

# {
#   Project   = "roboshop"
#   terraform = "true"
# }


# With dynamic tags like:

# {
#   Name = var.instances[count.index]
# }

# ✅ Solution:
# In your resource block (e.g., instances.tf), use merge() like this:


#   tags = merge(
#     var.common_Tags,
#     {
#       Name = var.instances[count.index]
#     }
#   )
# }

#similarly u can follow for sg tags as well

