# role to access s3 bucket
resource "aws_iam_role" "s3-bucket-role" {
  name = "s3-bucket-role"

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "tag-value"
  }
}

resource "aws_iam_role_policy" "s3-bucket-role-policy" {
  name = "s3-bucket-role-policy"
  role = aws_iam_role.s3-bucket-role.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:*",
        ]
        Effect   = "Allow"
        Resource = [
            "arn:aws:s3:::custome-s3-bucket-01",
            "arn:aws:s3:::custom-s3-bucket-01/*"
        ]
      },
    ]
  })
}

#instance identifier
resource "aws_iam_instance_profile" "s3-bucket-role-instance-profile" {
    name = "s3-bucket-role-instance-profile"
    role = aws_iam_role.s3-bucket-role.name
  
}