

resource "aws_security_group" "prod_wordpress_ec2_sg" {

	name = "ProdWordpressEC2SG"
	description = "This Security group allows HTTP and HTTPS Traffic from the Internet"
	vpc_id = var.cloud_rush_production_vpc

	ingress {
    description = "Allow HTTP from the Internet"
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Allow HTTP from the Internet"
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
      Name = "ProdWordpressEC2SG"
  }
}


data "template_file" "prod_ec2_template" {
  template = file("templates/prod_ec2.tpl")
}



resource "aws_instance" "prod_wordpress_ec2" {

	ami = var.prod_ami_id
	instance_type = var.prod_instance_type
	key_name = var.prod_key_name
	subnet_id = var.cloud_rush_public_subnet_1
	vpc_security_group_ids = [aws_security_group.prod_wordpress_ec2_sg.id, aws_security_group.cloudrush_internal_sg.id]
  user_data = data.template_file.prod_ec2_template.rendered

  root_block_device {   
      volume_type = "gp2"
      volume_size = 30
  }

  tags =  {
      Name = "Prod-Wordpress"
  }

}

resource "aws_eip" "prod_wordpress_ec2_eip" {
  instance = aws_instance.prod_wordpress_ec2.id
  vpc      = true
}


