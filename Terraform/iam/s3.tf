resource "aws_s3_bucket" "custom-s3-bucket-01" {
  bucket = "my-tf-test-bucket000000001"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}
