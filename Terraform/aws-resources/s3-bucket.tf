# S3 bucket

# resource "aws_s3_bucket" "terraform_state_bucket" {
#   bucket = "aws-my-tf-test-bucket009"

#   tags = {
#     Name        = "My bucket"
#     Environment = "Dev"
#   }

#   versioning {
#     enabled = true
#   }

#    server_side_encryption_configuration {
#     rule {
#       apply_server_side_encryption_by_default {
#         sse_algorithm = "AES256"
#       }
#     }
#   }
# }


# # Output variables to capture the resource names
# output "s3_bucket_name" {
#   value = aws_s3_bucket.terraform_state_bucket.bucket
# }

# output "dynamodb_table_name" {
#   value = aws_dynamodb_table.terraform_lock_table.name
# }