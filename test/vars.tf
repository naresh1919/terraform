variable "region" {
	default = "ap-south-1"
}
variable "vpc_cidr" {
	default = "190.160.0.0/16"
}
variable "subnet_cidr" {
	type = "list"
	default = ["190.160.1.0/26","190.160.2.0/26","190.160.3.0/26"]
}
variable "azs" {
	type = "list"
	default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
}
