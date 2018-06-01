resource "aws_vpc" "main" {
  cidr_block = "${var.vcn_cidr}"
}

resource "aws_subnet" "Public_Subnet1" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet1_cidr}"
  availability_zone = "${var.az1}"
  map_public_ip_on_launch = "true"

  tags {
    Name = "main"
  }
}

resource "aws_subnet" "Public_Subnet2" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet2_cidr}"
  availability_zone = "${var.az2}"
  map_public_ip_on_launch = "true"

  tags {
    Name = "main"
  }
}

resource "aws_subnet" "Public_Subnet3" {
  vpc_id     = "${aws_vpc.main.id}"
  cidr_block = "${var.subnet3_cidr}"
  availability_zone = "${var.az3}"
  map_public_ip_on_launch = "true"

  tags {
    Name = "main"
  }
}

resource "aws_security_group" "allow_all" {
  name        = "allow_all"
  description = "Allow all traffic"
  vpc_id      = "${aws_vpc.main.id}"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
}

resource "aws_internet_gateway" "gw" {
  vpc_id = "${aws_vpc.main.id}"

  tags {
    Name = "main"
  }
}

resource "aws_route_table" "route_table" {
  vpc_id = "${aws_vpc.main.id}"

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = "${aws_internet_gateway.gw.id}"
  }
}

resource "aws_main_route_table_association" "route_table_association" {
  vpc_id         = "${aws_vpc.main.id}"
  route_table_id = "${aws_route_table.route_table.id}"
}
