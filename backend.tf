terraform {
	backend "s3" {
		bucket = "ipa-schneuwlyd-ff"
		key = "terraform.tfstate"
		region = "eu-central-1"
	}
}
