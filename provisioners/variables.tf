variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "tag_name" {

  type    = map(string)

  default = {
    Name = "example"
  }

}

variable "sg_name" {
  type    = string
  default = "allow_all_ip"
}

variable "sg_description" {
  type    = string
  default = "Allow all inbound traffic and all outbound traffic"
}


variable "from_port" {
 
  default = 0

}

variable "to_port" {
 
  default = 0
  
}

variable "cidr_blocks" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "sg_tag_name" {

  type    = map(string)

  default = {
    Name = "allow_all_ip"
  }

}