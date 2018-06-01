resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh-key"
  public_key = "${file("/root/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "this" {
  ami           = "ami-d01b2f3b"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1a"
  key_name = "${aws_key_pair.ssh_key.id}"
  subnet_id = "${var.subnet_id}"
  vpc_security_group_ids = ["${var.security_group_id}"]
}

resource "aws_ebs_volume" "example" {
  availability_zone = "eu-central-1a"
  size = 40
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.this.id}"
}
