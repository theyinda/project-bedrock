# Developer IAM User
resource "aws_iam_user" "dev_view" {
  name = "bedrock-dev-view"
  tags = { Name = "bedrock-dev-view" }
}

resource "aws_iam_user_policy_attachment" "readonly" {
  user       = aws_iam_user.dev_view.name
  policy_arn = "arn:aws:iam::aws:policy/ReadOnlyAccess"
}

# S3 PutObject policy for dev user
resource "aws_iam_user_policy" "s3_put" {
  name = "bedrock-dev-s3-put"
  user = aws_iam_user.dev_view.name

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect   = "Allow"
      Action   = ["s3:PutObject"]
      Resource = "${var.s3_bucket_arn}/*"
    }]
  })
}

# Access Key for dev user
resource "aws_iam_access_key" "dev_view" {
  user = aws_iam_user.dev_view.name
}

# Console access (login profile)
resource "aws_iam_user_login_profile" "dev_view" {
  user                    = aws_iam_user.dev_view.name
  password_reset_required = false
}
