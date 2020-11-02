resource "aws_db_instance" "ericsson_mysql" {
  allocated_storage    = 10
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = "8.0.20"
  instance_class       = "db.t2.micro"
  name                 = "mydb"
  username             = "admin"
  password             = "admin123"
  identifier		   = "ericsson-kul"
  publicly_accessible  = "true"
  skip_final_snapshot  = "true"
  //final_snapshot_identifier = "demo"
}

resource "mysql_database" "ericsson_db" {
	name = "ericsson_db"
}

resource "mysql_user" "dbuser" {
	user = "dbuserkul"
	host = aws_instance.ericsson_server[0].private_ip
	plaintext_password = "dbpwdkul"
}

resource "mysql_grant" "dbgrant" {
	user = mysql_user.dbuser.user
	host = mysql_user.dbuser.host
	database = mysql_database.ericsson_db.name
	privileges = ["SELECT","UPDATE"]
}