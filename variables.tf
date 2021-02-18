# variables.tf


variable "access_key" {
     default = ""
}

variable "secret_key" {
     default = ""
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

variable "dev_instance_type" {
     default = "t3.medium"
}


variable "dev_key_name" {
     default = "cloudrush_dev_wordpress"
}


