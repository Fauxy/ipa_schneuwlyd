resource "aws_internet_gateway" "gw" {
	vpc_id = "${aws_vpc.ipa_vpc.id}"
	tags {
		Name = "ipa_gw"
	}
}