resource "aws_instance" "ericsson_server" {
	ami = "ami-01e36b7901e884a10"
	instance_type = "t2.micro"
	key_name = "ericsson-kul"
	count = 2
	tags = {
		Name = "Ericsson-Kul"
	}
}

resource "aws_security_group" "ericsson_sg" {
	name = "kul-sg"
	description = "added for terraform demo"
	egress {
		from_port = 0
		to_port = 0
		protocol = "-1"
		cidr_blocks = ["0.0.0.0/0"]
	}
	ingress {
		from_port = 22
		to_port = 22
		protocol = "tcp"
		cidr_blocks = ["0.0.0.0/0"]
	}
}