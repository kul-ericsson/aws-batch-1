resource "aws_ebs_volume" "ericsson-vol" {
	size = 10
	availability_zone = "us-east-2a"
	tags = {
		Name = "Ericsson-Kul"
	}
}