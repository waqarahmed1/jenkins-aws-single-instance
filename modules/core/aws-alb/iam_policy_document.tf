data "aws_iam_policy_document" "alb_logging_bucket_policy_document" {
  statement {
    sid = "AllowingALBLogsInS3"

    actions = [
      "s3:PutObject",
    ]

    resources = ["arn:aws:s3:::${var.bucket_name}/*"]

    #identifiers points at a data source which performs a lookup of the account/region of the ALB
    principals {
      identifiers = ["arn:aws:iam::${data.aws_elb_service_account.account.id}:root"]
      type        = "AWS"
    }
  }
}