locals {
 Full_name = "${var.project}-${var.environment}-${var.component}"

 tags= merge(var.common-tags,{
    version = 1.0
 }
 )
}


# variables defined in locals cannot be overridden.

# so if u want ur variables not to get override we can use locals

# if they can be overriden based on need write them in variables file