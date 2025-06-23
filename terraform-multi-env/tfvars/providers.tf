terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.98.0"
    }
  }
}

terraform {
  backend "s3" {
    #as we are creating multiple env here. we should have different buckets to store differnt env state files
    #and also we should use differnt keys (names of state files ) for each key file
    #to do so we should maintain different folders to specify configurations clearly
    #so backend config is written in backend.tfvars file in dev and prod folders.
    #Note: we should definitely define backend s3 here in providers. otherwise terraform will give errors. we can specify actual backend config in their individual files but declaration should be here.
  }
}

provider "aws" {
  # Configuration options
  #configure in your own system using aws configure it's more secure than configuring here itself

}