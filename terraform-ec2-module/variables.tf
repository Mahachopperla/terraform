#-> even if we declare variables with values here, if user gives their own values in project code. these values will be overwritten.

variable "ami_id" {
    type = string
    default = "ami-09c813fb71547fc4f"
}

#Here we are writng validation function to validate instance_type. if instance_type is any other type which is not mentioned in above list then it will show error message which we gave.
# -> by using this we can make sure that end user will not go beyond these 3 types.
# -> which means we can control the actions of end user who is using our module . so we can say enforce standards through modules.(ee standards mana company decide chesthundhi) like ee types kantey manaki yekuva create chesye access ivakudadhu anukunapudu we use this.


variable "instance_type" {
  type = string
  default = "t2.micro"

  validation {
    condition     = contains(["t2.micro", "t3.micro", "t2.small"], var.instance_type)
    error_message = "Variable type should be in these 3 values only.['t2.micro','t3.micro','t2.small'] "
  }
}

#when we declare empty variables , terraform makes this entry mandatory when user is using this module
#terraform will ask prompt from user to enter sg_ids if it is not declared in main script
#-> use plural names if the return values is plural
#-> as we can have any no.of sg_id's we are declaring it as list. so that user can attach any no.of sg_id's to ec2 instance

variable "sg_ids" {
    type = list
  
}

# we are making tags also mandatory to use, so we are decalring empty tags

variable "tags" {
  type = map
}

