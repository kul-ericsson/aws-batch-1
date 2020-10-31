resource "aws_ebs_volume" "ericsson-vol" {
	size = 10
	availability_zone = "us-east-2a"
	tags = {
		Name = "Ericsson-Kul"
	}
}

resource "aws_volume_attachment" "attach-vol" {
	volume_id = aws_ebs_volume.ericsson-vol.id
	instance_id = aws_instance.ericsson_server.id
	device_name = "/dev/sdf"
}