variable "ipa_region" {
	default = "eu-central-1"
}

variable "vpc_cidr" {
	default = "10.0.0.0/16"
}

variable "public_1_cidr" {
	default = "10.0.0.0/24"
}

variable "public_2_cidr" {
	default = "10.0.10.0/24"
}

variable "private_1_cidr" {
	default = "10.0.1.0/24"
}

variable "private_2_cidr" {
	default = "10.0.11.0/24"
}

variable "all_cidr" {
	default = "0.0.0.0/0"
}

variable "az_a" {
	default = "eu-central-1a"
}

variable "az_b" {
	default = "eu-central-1b"
}

variable "nat_instance" {
	default = "t2.micro"
}

variable "asg_instance"{
	default = "t2.micro"
}

variable "nat_ami" {
	default = "ami-1b2bb774"
}

variable "asg_ami" {
	default = "ami-1b2bb774"
}

variable "min_size" {
	default = 2
}

variable "max_size" {
	default = 6
}

