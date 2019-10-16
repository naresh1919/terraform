provider "aws" {
  region = "ap-south-1"
}

resource "aws_vpc" "selected" {
  cidr_block = "10.10.0.0/16"
}

resource "aws_subnet" "selected" {
	vpc_id	= "${aws_vpc.selected.id}"
	availability_zone = "ap-south-1a"
	cidr_block = "10.10.1.0/26"
	map_public_ip_on_launch = true
#	modify_auto-assign_IP_setting = "enable"
}

resource "aws_subnet" "selected2" {
	vpc_id = "${aws_vpc.selected.id}"
	availability_zone = "ap-south-1b"
	cidr_block = "10.10.2.0/26"
}
resource "aws_subnet" "selected3" {
        vpc_id = "${aws_vpc.selected.id}"
        availability_zone = "ap-south-1c"
        cidr_block = "10.10.3.0/26"
}
resource "aws_internet_gateway" "my_vpc_gw" {
        vpc_id = "${aws_vpc.selected.id}"
}

resource "aws_route_table" "route_table" {
	vpc_id = "${aws_vpc.selected.id}"

}
resource "aws_route" "gate_asso" {
	route_table_id = "${aws_route_table.route_table.id}"
	destination_cidr_block = "0.0.0.0/0"
	gateway_id = "${aws_internet_gateway.my_vpc_gw.id}"
}
resource "aws_route_table_association" "my_route_ts" {
	subnet_id = "${aws_subnet.selected.id}" #  "${aws_subnet.selected2.id}"
	route_table_id = "${aws_route_table.route_table.id}"
}
resource "aws_route_table_association" "my_route_ts2" {
        subnet_id = "${aws_subnet.selected2.id}"
        route_table_id = "${aws_route_table.route_table.id}"
}

