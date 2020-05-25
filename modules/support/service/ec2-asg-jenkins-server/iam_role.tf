resource "aws_iam_role" "mg_jenkins_ec2_role" {
  name               = "${var.environment}-${var.service_name}-ec2-role"
  assume_role_policy = data.aws_iam_policy_document.ec2_assume_role_policy.json
}