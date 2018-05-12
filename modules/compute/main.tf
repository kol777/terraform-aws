resource "aws_key_pair" "ssh_key" {
  key_name   = "ssh-key"
  public_key = "${file("/root/.ssh/id_rsa.pub")}"
}

resource "aws_instance" "web" {
  ami           = "ami-c86c3f23"
  instance_type = "t2.micro"
  availability_zone = "eu-central-1a"
  key_name = "${aws_key_pair.ssh_key.id}"

}

resource "aws_ebs_volume" "example" {
  availability_zone = "eu-central-1a"
  size = 40
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = "${aws_ebs_volume.example.id}"
  instance_id = "${aws_instance.web.id}"
}
