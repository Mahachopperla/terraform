variable "ami_id" {
  type    = string
  default = "ami-09c813fb71547fc4f"
}

variable "instance_type" {
  type    = string
  default = "t3.micro"
}

variable "tag_name" {

  type = map(string)

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

  type = map(string)

  default = {
    Name = "allow_all_ip"
  }

}

# if environment is dev we use one kind of instance type . if environement is prod then we may require high capacity instance type.check "

#check in instances.tf i have written condition expression there

variable "Environment" {
  type    = string
  default = "prod"
}

variable "instances" {
  type    = list(string)
  default = ["mysql", "mongodb"]
}

variable "zone_id" {
  type    = string
  default = "Z02829133T93YRRJ2VRGM"
}

variable "domain_name" {
  type    = string
  default = "robotshop.site"
}