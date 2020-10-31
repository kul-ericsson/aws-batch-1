output "ericsson_server_public_IP" {
	value = aws_instance.ericsson_server.*.public_ip
}