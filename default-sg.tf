resource "aws_security_group" "cloudrush_internal_sg" {

	name = "CloudRushInternalSG"
	description = "This Security group allows all traffic from whitelisted IPs"
	vpc_id =  var.cloud_rush_production_vpc

	ingress {
		description = "All Traffic from My IP"
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["42.111.138.65/32"]
    }
    

    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }


    tags = {
        Name = "CloudRusInternalSG"
    }
}