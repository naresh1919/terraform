provider "aws" {
        region = "ap-south-1"
}
/*
# create ami from the block storage
resource "aws_ami" "example" {
        name = "terraform-example"
        virtualization_type = "hvm"
        root_device_name = "/dev/xvda"

        ebs_block_device {
                device_name = "/dev/xvda"
                snapshot_id = "snap-01fbc58e63d8a85ef"
                volume_size = 8
                }
        tags = {
        Name = "terraform"
        }
} */
/*
# copy ami from one region to another region
        resource "aws_ami_copy" "examplecopy" {
       name = "terraform-exaple"
        description = "a copy of ami"
        source_ami_id = "ami-0dd655843c87b6930"
        source_ami_region = "us-west-1"
}
*/
/*
# create ami from the instance
resource "aws_ami_from_instance" "example" {
        name = "terraform-example"
        source_instance_id = "i-0e73ea4415f34b5a8"
}
*/
/*
# creates the snap shots from volume
resource "aws_ebs_snapshot" "example" {
        volume_id = "vol-0566d979436104008"
        tags = {
                Name = "naresh-snap"
        }
}
*/
