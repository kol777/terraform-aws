provider "aws" {
  region = "eu-central-1"
  shared_credentials_file = "/.aws/credentials"
  profile                 = "default"
}


module "aws_instance" {
  source = "modules/compute"  
}
