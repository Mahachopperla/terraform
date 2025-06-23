variable "sg_ids" {
    type = list
    default = ["sg-03de6c7ee76a1f5a3"]
  
}

variable "tags" {
  type = map
  default = {
    Project = "roboshop"
    Environment = "dev"
  }
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

# here for instance_type module have some restrictions.
#if we go beyond that restrictions and used instance_type of our own wish then terraform will give us error

#check instance_Type in terraform_modules to know what types of instances are allowed.

