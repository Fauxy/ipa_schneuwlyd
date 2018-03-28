resource "aws_nat_gateway" "nat_gw_1" {
	allocation_id	= "${aws_eip.nat_gw_1.id}"
	subnet_id		= "${aws_subnet.public_1.id}"

	tags {
		Name = "nat_gw_1"
	}
}

resource "aws_eip" "nat_gw_1" {
	vpc		 = true

}

resource "aws_nat_gateway" "nat_gw_2" {
	allocation_id	= "${aws_eip.nat_gw_2.id}"
	subnet_id		= "${aws_subnet.public_2.id}"

	tags {
		Name = "nat_gw_2"
	}
}

resource "aws_eip" "nat_gw_2" {
	vpc		 = true
}
