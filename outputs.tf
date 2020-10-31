output "ericsson_server_public_IP" {
	value = aws_instance.ericsson_server.*.public_ip
}

output "ericsson_server_public_DNS" {
	value = aws_instance.ericsson_server.*.public_dns
}

output "ericsson_server_private_IP" {
	value = aws_instance.ericsson_server.*.private_ip
}

output "ericsson_vol_IDs" {
	value = aws_ebs_volume.ericsson-vol.*.id
}