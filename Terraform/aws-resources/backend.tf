#S3 backend with dynamodb lock  -----Backend will only run if the resource s3 and dynamodb
#is already created

terraform {
  backend "s3" {
    bucket         = "aws-my-tf-test-bucket009"
    key            = "terraform.tfstate"
    region         = "ap-south-1" # Replace with your desired region
    encrypt        = true
    dynamodb_table = "terraform_lock_table"
  }
}