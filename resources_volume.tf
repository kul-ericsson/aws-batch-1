resource "aws_ebs_volume" "ericsson-vol" {
	size = 10
	availability_zone = var.aws_az
	count = var.server_count
	tags = {
		Name = "Ericsson-Kul"
	}
}

resource "aws_volume_attachment" "attach-vol" {
	count = var.server_count
	volume_id = aws_ebs_volume.ericsson-vol[count.index].id
	instance_id = aws_instance.ericsson_server[count.index].id
	device_name = "/dev/sdf"
	
	provisioner "remote-exec" {
		connection {
			type = "ssh"
			user = "centos"
			private_key = file("C:/training/ericsson/aws/batch-1/ericsson-kul.pem")
			host = aws_instance.ericsson_server[count.index].public_ip
		}
		inline = [
			"sudo mkfs -t ext4 /dev/xvdf",
			"sudo mkdir /data",
			"sudo mount /dev/xvdf /data"
		]
	}	
}