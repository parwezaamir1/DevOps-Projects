# resource "aws_dynamodb_table" "terraform_lock_table" {
#   name         = "terraform_lock_table"
#   billing_mode = "PAY_PER_REQUEST"
#   hash_key     = "LockID"
#   attribute {
#     name = "LockID"
#     type = "S"
#   }
# }