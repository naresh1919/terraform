provider "aws" {
        region = "ap-south-1"
}
resource "aws_s3_bucket" "b" {
        bucket = "naresh-test-bucket123"
        acl = "public-read"
        versioning {
        enabled = "true"
}

        tags = {
                Name = "my bucket"
                Enverolment = "dev"
        }
}
