resource "aws_iam_instance_profile" "instance_profile" {
  name = "${var.environment}-${var.service_name}-ec2-instance-profile"
  role = aws_iam_role.mg_jenkins_ec2_role.name
}