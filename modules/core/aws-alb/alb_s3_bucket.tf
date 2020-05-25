resource "aws_s3_bucket" "alb_log_bucket" {
  count         = var.alb_enable_logging ? 1 : 0
  bucket        = var.bucket_name
  policy        = data.aws_iam_policy_document.alb_logging_bucket_policy_document.json
  force_destroy = var.force_destroy_alb_log_bucket

  tags = {
    Name        = var.bucket_name
    Environment = var.environment
    Service     = var.service_name
  }

  versioning {
    enabled = true
  }

  lifecycle_rule {
    enabled = false
  }
}