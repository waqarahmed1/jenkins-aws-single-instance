resource "aws_iam_policy" "ec2_policy" {
  name   = "${var.environment}-${var.service_name}-ec2-policy"
  policy = data.aws_iam_policy_document.ec2_role_policy_document.json
}

