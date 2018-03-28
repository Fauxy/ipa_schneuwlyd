resource "aws_autoscaling_group" "ipa_asg" {
	name 					= "ipa_asg"
	launch_configuration	= "${aws_launch_configuration.ipa_launch.id}"
	vpc_zone_identifier 	= ["${aws_subnet.private_1.id}", "${aws_subnet.private_2.id}"]
	min_size				= "${var.min_size}"
	max_size				= "${var.max_size}"
	load_balancers			= ["${aws_elb.ipa_elb.id}"]
	health_check_type		= "ELB"

	tag {
		key					= "Name"
		value				= "ipa_asg"
		propagate_at_launch	= "true"

	}
}


resource "aws_launch_configuration" "ipa_launch" {
	name 			= "ipa_launch"
	image_id		= "${var.asg_ami}"
	instance_type	= "${var.asg_instance}"
	security_groups	= ["${aws_security_group.asg.id}"]
	user_data		= "${file("nginx.sh")}"
}

resource "aws_security_group" "asg" {
	name = "sg_asg"
	vpc_id	= "${aws_vpc.ipa_vpc.id}"
	ingress {
		from_port	= 80
		to_port		= 80
		protocol	= "tcp"
		cidr_blocks	= ["${var.all_cidr}"]
	}

	egress {
		from_port	= 0
		to_port		= 0
		protocol	= "-1"
		cidr_blocks	= ["${var.all_cidr}"]
	}
}
