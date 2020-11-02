resource "null_resource" "for_configs" {
	
	provisioner "remote-exec" {
		connection {
			type = "ssh"
			user = "centos"
			private_key = file("C:/training/ericsson/aws/batch-1/ericsson-kul.pem")
			host = aws_instance.ericsson_server[0].public_ip
		}
		inline = [
			"sudo yum install -y mysql"
		]
	}	
}