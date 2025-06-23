#A Terraform module is just a folder of .tf files (Terraform code) that you can reuse in many places.

resource "aws_instance" "this" {
  ami           = var.ami_id
  instance_type = var.instance_type
  vpc_security_group_ids = var.sg_ids
  

  tags = var.tags
}

# Naming convention:

# ->Resource name should be named this,if there is no more descriptive and general name available
# 		resource "aws_instance" "this" {
		
# ->Use _ (underscore) instead of - (dash) everywhere (in resource names, data source names, variable names, outputs, etc).

# 			names which are exposed to humans -(use hyphen)
# 			names which are refered by programms should use _(underscore)

# ->Prefer to use lowercase letters and numbers 

# ->Do not repeat resource type in resource name (not partially, nor completely)

# 			`resource "aws_route_table" "public_route_table" {}`-> wrong usage
# 			`resource "aws_route_table" "public" {}`-> correct usage
			
# -> use plural names if the return values is plural