resource "aws_elb" "ipa_elb" {
	name				= "ipa-elb"
	subnets				= ["${aws_subnet.public_1.id}", "${aws_subnet.public_2.id}"]
	security_groups		= ["${aws_security_group.elb.id}"]

	listener {
		instance_port		= 80
		instance_protocol	= "http"
		lb_port				= 80
		lb_protocol			= "http"
	}

	health_check {
		healthy_threshold	= 2
		unhealthy_threshold	= 2
		timeout				= 3
		target				= "HTTP:80/"
		interval			= 30
	}
}

resource "aws_security_group" "elb" {
	name 	= "ipa_elb"
	vpc_id	= "${aws_vpc.ipa_vpc.id}"

	egress {
		from_port	= 0
		to_port		= 0
		protocol 	= "-1"
		cidr_blocks	= ["${var.all_cidr}"]
	}

	ingress {
		from_port	= 80
		to_port		= 80
		protocol 	= "tcp"
		cidr_blocks	= ["${var.all_cidr}"]
	}
}