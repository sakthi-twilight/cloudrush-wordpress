# variables.tf


variable "access_key" {
     default = "<Access Key>"
}

variable "secret_key" {
     default = "<Secret Key>"
}


variable "region" {
     default = "us-east-2"
}

variable "cloud_rush_production_vpc" {
    default = "vpc-02651c9601325ba32"
} 

variable "cloud_rush_public_subnet_1" {
    default = "subnet-0263938c084790184"
} 


variable "cloud_rush_public_subnet_2" {
    default = "subnet-0ad75b73c957b1edc"
} 


variable "dev_ami_id" {
     default = "ami-02aa7f3de34db391a"
}

variable "prod_ami_id" {
     default = "ami-02aa7f3de34db391a"
}

variable "dev_instance_type" {
     default = "t3.medium"
}

variable "prod_instance_type" {
     default = "t3.medium"
}


variable "dev_key_name" {
     default = "cloudrush_dev_wordpress"
}

variable "prod_key_name" {
     default = "cloudrush_prd_wordpress"
}

variable "dev_wordpress_target_arn" {
	default = "arn:aws:elasticloadbalancing:us-east-2:762900496746:targetgroup/dev-wordpress-target/4e3b11d941a48894"
}

variable "cloud_rush_certificate_arn" {
	default = "arn:aws:acm:us-east-2:762900496746:certificate/d6608ab6-216c-4233-95bc-55a7da8608d5"
}

