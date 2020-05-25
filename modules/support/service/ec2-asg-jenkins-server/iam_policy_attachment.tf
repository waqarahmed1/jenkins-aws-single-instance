resource "aws_iam_policy_attachment" "ec2_iam_policy_attachment" {
  name = "${var.environment}-${var.service_name}-ec2-attachment"
  roles = [
    aws_iam_role.mg_jenkins_ec2_role.name
  ]
  policy_arn = aws_iam_policy.ec2_policy.arn
}