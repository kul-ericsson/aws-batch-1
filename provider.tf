# Configuring the Providers

provider "aws" {
	region = var.aws_region
}

provider "mysql" {
	endpoint = aws_db_instance.ericsson_mysql.endpoint
	username = aws_db_instance.ericsson_mysql.username
	password = aws_db_instance.ericsson_mysql.password
}