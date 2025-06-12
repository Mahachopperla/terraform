variable "project" {
    default = "Roboshop"
}

variable "environment" {
    default = "dev"
  
}

variable "component" {
    default = "mongodb"
  
}

#if we want to use variable insdie other variable it gives error

/* variable "final-name" {
    default = "${var.project}-${var.environment}-${var.component}"
} */

#this throws error as a variable cannot refer other vaiable

#if we want to do so we should use locals


#############

#we can also write functions in locals 

variable "common-tags" {
  default = {
        Project = "roboshop"
        Terraform = "true"
    }
  
}