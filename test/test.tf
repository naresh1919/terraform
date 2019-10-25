provider "aws" {
        region = "${var.region}"
}
resource "aws_vpc" "main" {
        cidr_block = "${var.vpc_cid}"
        instance_tenancy = "default"
        tags = {
                Name = "naresh-vpc"
        }
}
resource "aws_subnet" "sub" {
        count = "${length(var.azs)}"
        vpc_id = "${aws_vpc.main.id}"
        cidr_block = "${element(var.subnet_cidr,count.index)}"
        map_public_ip_on_launch = true
        tags = {
                Name = "my-subnet count.index"
        }
}
resource "aws_internet_gateway" "my_igw" {
        vpc_id = "${aws_vpc.main.id}"
}
resource "aws_route_table" "route_table" {
        vpc_id = "${aws_vpc.main.id}"
}
resource "aws_route" "gate_foo" {
        route_table_id = "${aws_route_table.route_table.id}"
        destination_cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.my_igw.id}"
}
resource "aws_route_table_association" "routs_ass" {
        count = "${length(var.azs)}"
        subnet_id = "${aws_subnet.sub[count.index].id}"
        route_table_id = "${aws_route_table.route_table.id}"
}
# resource "aws_default_network_acl" "default" {
#       default_network_acl_id = "${aws_vpc.main.default_network_acl_id}"
# }
resource "aws_default_route_table" "r" {
        default_route_table_id = "${aws_vpc.main.default_route_table_id}"
        tags = {
                Name = "default table"
        }
}
resource "aws_subnet" "sublk" {
        vpc_id = "${aws_vpc.main.id}"
        cidr_block = "120.10.4.0/26"
        map_public_ip_on_launch = true
}
resource "aws_route_table_association" "gate-foon" {
        subnet_id = "${aws_subnet.sublk.id}"
        route_table_id = "${aws_default_route_table.r.id}"
