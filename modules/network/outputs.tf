output "public_subnet_1_id" {
  value = "${aws_subnet.Public_Subnet1.id}"
}

output "public_subnet_2_id" {
  value = "${aws_subnet.Public_Subnet2.id}"
}

output "public_subnet_3_id" {
  value = "${aws_subnet.Public_Subnet3.id}"
}

output "security_group_id"{
  value = "${aws_security_group.allow_all.id}"
}
