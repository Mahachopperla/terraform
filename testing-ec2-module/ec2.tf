#this is the actual file where we write script and invoke module whenver it is required.

module "ec2" {
    source = "../terraform-modules"  #we are giving path for terraform module
    instance_type = var.instance_type
    sg_ids = var.sg_ids
    tags = var.tags
}