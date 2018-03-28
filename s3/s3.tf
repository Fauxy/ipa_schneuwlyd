resource "aws_s3_bucket_object" "ipa_state" {
	bucket = "ipa-schneuwlyd-ff"
	key = "terraform.tfstate"
	source = "../terraform.tfstate"
	acl = "private"
}

