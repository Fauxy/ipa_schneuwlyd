#Availabilty Zone 1

resource "aws_subnet" "public_1" {
	vpc_id					= "${aws_vpc.ipa_vpc.id}"
	cidr_block				= "${var.public_1_cidr}"
	map_public_ip_on_launch = true
	availability_zone		= "${var.az_a}"

	tags {
		Name = "public subnet 1a"
	}
}

resource "aws_route_table" "public_1" {
	vpc_id = "${aws_vpc.ipa_vpc.id}"

	route {
		cidr_block = "${var.all_cidr}"
		gateway_id = "${aws_internet_gateway.gw.id}"
	}

	tags {
		Name = "Public_1"
	}
}

resource "aws_route_table_association" "public_1_subnet_association" {
	subnet_id 		= "${aws_subnet.public_1.id}"
	route_table_id 	= "${aws_route_table.public_1.id}"
}

resource "aws_subnet" "private_1" {
	vpc_id					= "${aws_vpc.ipa_vpc.id}"
	cidr_block				= "${var.private_1_cidr}"
	map_public_ip_on_launch = true
	availability_zone		= "${var.az_a}"

	tags {
		Name = "private subnet 1a"
	}
}

resource "aws_route_table" "private_1" {
	vpc_id = "${aws_vpc.ipa_vpc.id}"

	route {
		cidr_block 	= "${var.all_cidr}"
		gateway_id	= "${aws_nat_gateway.nat_gw_1.id}"
	}

	tags {
		Name = "Private_1"
	}
}

resource "aws_route_table_association" "private_1_subnet_association" {
	subnet_id 		= "${aws_subnet.private_1.id}"
	route_table_id 	= "${aws_route_table.private_1.id}"
}

#Availability Zone 2

resource "aws_subnet" "public_2" {
	vpc_id					= "${aws_vpc.ipa_vpc.id}"
	cidr_block				= "${var.public_2_cidr}"
	map_public_ip_on_launch = true
	availability_zone		= "${var.az_b}"

	tags {
		Name = "public subnet 1b"
	}
}

resource "aws_route_table" "public_2" {
	vpc_id = "${aws_vpc.ipa_vpc.id}"

	route {
		cidr_block = "${var.all_cidr}"
		gateway_id = "${aws_internet_gateway.gw.id}"
	}

	tags {
		Name = "Public_2"
	}
}

resource "aws_route_table_association" "public_2_subnet_association" {
	subnet_id 		= "${aws_subnet.public_2.id}"
	route_table_id 	= "${aws_route_table.public_2.id}"
}

resource "aws_subnet" "private_2" {
	vpc_id					= "${aws_vpc.ipa_vpc.id}"
	cidr_block				= "${var.private_2_cidr}"
	map_public_ip_on_launch = true
	availability_zone		= "${var.az_b}"

	tags {
		Name = "private subnet 1b"
	}
}

resource "aws_route_table" "private_2" {
	vpc_id = "${aws_vpc.ipa_vpc.id}"

	route {
		cidr_block 	= "${var.all_cidr}"
		gateway_id	= "${aws_nat_gateway.nat_gw_2.id}"
	}

	tags {
		Name = "Private_2"
	}
}

resource "aws_route_table_association" "private_2_subnet_association" {
	subnet_id 		= "${aws_subnet.private_2.id}"
	route_table_id 	= "${aws_route_table.private_2.id}"
}
