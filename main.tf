provider "aws" {
  region = "eu-central-1"
  shared_credentials_file = "~/.aws/credentials"
  profile                 = "default"
}


module "aws_instance" {
  source = "modules/compute"
  subnet_id = "${module.aws_vpc.public_subnet_1_id}"
  security_group_id = "${module.aws_vpc.security_group_id}"
}

module "aws_vpc"{
  source = "modules/network"
  vcn_cidr = "${var.vcn_cidr}"
  subnet1_cidr = "${var.subnet1_cidr}"
  subnet2_cidr = "${var.subnet2_cidr}"
  subnet3_cidr = "${var.subnet3_cidr}"
  az1 = "${var.az1}"
  az2 = "${var.az2}"
  az3 = "${var.az3}"
}
