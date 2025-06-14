terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}

# Generally state files created in local will be stored in same directory with name terraform.tfstate. Now inorder to save this tfstate file in remote location(s3)
# we need to include backend block in provider.tf file so that terraform will know it should store tfstate file in location which is specified in backed block.


terraform {
  backend "s3" {
    bucket = "statefile-example"
    key    = "creating-ec2-instance"
    region = "us-east-1"
    encrypt = true
    use_lockfile = true
  }
}


provider "aws" {
  # Configuration options
  #configure in your own system using aws configure it's more secure than configuring here itself

}