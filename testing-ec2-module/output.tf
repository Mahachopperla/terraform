output "pub_ip" {
    value = module.ec2.public_ip
}
#you're saying:
#From the module named ec2, get the value of the output named public_ip."
#in ec2 module we have given choosen source as terraform module
#so, this will take the output from module code and assigns to variable pub_ip

output "pri_ip" {
    value = module.ec2.private_ip
  
}

output "inst_id" {
    value = module.ec2.instance_id
  
}