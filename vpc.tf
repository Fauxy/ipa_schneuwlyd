resource "aws_vpc" "ipa_vpc" {
	cidr_block = "${var.vpc_cidr}"

	tags {
		Name = "ipa_vpc"
	}
}