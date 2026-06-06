output "bucket_name" { value = aws_s3_bucket.assets.bucket }
output "bucket_arn" { value = aws_s3_bucket.assets.arn }
output "lambda_arn" { value = aws_lambda_function.asset_processor.arn }
