output "asg_id" {
  value = compact(concat(aws_autoscaling_group.asg.*.id, list("")))
}

output "asg_name" {
  value = compact(concat(aws_autoscaling_group.asg.*.name, list("")))
}