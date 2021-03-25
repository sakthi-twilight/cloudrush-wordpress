resource "aws_security_group" "dev_wordpress_elb_sg" {

  name = "DevWordpressELBSG"
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
      Name = "DevWordpressELBSG"
  }
}

resource "aws_lb" "dev_wordpress_elb" {
  name               = "dev-wordpress-elb"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [ aws_security_group.cloudrush_internal_sg.id,
                         aws_security_group.dev_wordpress_elb_sg.id]
  subnets            = [var.cloud_rush_public_subnet_1,var.cloud_rush_public_subnet_2]
  
  enable_deletion_protection = true

  tags = {
    Name = "DevWordpressELB"
  }
}

resource "aws_lb_listener" "port_443" {
  load_balancer_arn = aws_lb.dev_wordpress_elb.arn
  port              = "443"
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = var.cloud_rush_certificate_arn

  default_action {
    type             = "forward"
    target_group_arn = var.dev_wordpress_target_arn
  }
}

resource "aws_lb_listener" "port_80" {
  load_balancer_arn = aws_lb.dev_wordpress_elb.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = var.dev_wordpress_target_arn
  }
}