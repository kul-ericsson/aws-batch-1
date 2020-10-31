resource "aws_instance" "centos_server" {
	ami = "ami-01e36b7901e884a10"
	instance_type = "t2.micro"
	key_name = "ericsson-kul"
	count = 2
	tags = {
		Name = "Ericsson-Kul"
	}
}