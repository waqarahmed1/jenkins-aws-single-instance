variable "additional_ebs_device" {
  type        = list(map(string))
  description = "addtional ebs block devices to attach to instance, these could be a list of maps"
}

variable "tags_as_map" {
  type        = map(string)
  description = "map of additional tags, converted to ASG format"
}

variable "tags" {
  description = "A list of tag blocks. Each element should have keys named key, value, and propagate_at_launch."
  type        = list(map(string))
  default     = []
}

variable "asg_name" {
  description = "Name of the ASG, this is merged with placement to create name_prefix for the actual ASG name"
}

variable "asg_instance_name" {
  description = "name to call the instance produced by ASG, ie in the Name tag, should accept interpolation"
}

variable "associate_public_ip_address" {
  type        = bool
  description = "true/false, only true for instance in a public subnet"
}

variable "create_asg" {
  type        = bool
  description = "Whether or not to create the ASG as creating LC alone is sometimes necessary"
}

variable "create_lc" {
  description = "Whether or not to create a launch config, as ASG's can be associated with existing LC's"
}

variable "desired_capacity" {
  type        = number
  description = "Desired number of instances for the ASG"
}

variable "ebs_optimised" {
}

variable "environment" {
  description = "Environment"
}

variable "force_delete" {
  type        = bool
  description = "Ability to delete the ASG without all the instances terminating"
  default     = "false"
}

variable "iam_instance_profile" {
}

variable "image_id" {
  type = string
}

variable "instance_type" {
}

variable "key_name" {
}

variable "launch_configuration" {
  description = "Name of the Launch Configuration if created outside this module"
  default     = ""
}

variable "lc_user_data" {
}

variable "load_balancers" {
  type        = list(string)
  description = "A list of ELB names to add to the ASG"
}

variable "max_size" {
  type        = number
  description = "Min number of instances for the ASG"
}

variable "min_size" {
  type        = number
  description = "Min number of instances for the ASG"
}

variable "placement" {
  description = "Indicates whether to be public or private, doesn't enforce the actual placement but used for naming"
}

variable "placement_tenancy" {
  description = "default or dedicated, dedicated overrides the vpc default of shared infrastructure"
  default     = "default"
}

variable "root_block_device" {
  type        = list(map(string))
  description = "Custom details about the root block device, see https://www.terraform.io/docs/providers/aws/r/launch_configuration.html#block-devices"
}

variable "security_groups" {
  type = list(string)
}

variable "target_group_arns" {
  type        = list(string)
  description = "A list of ALB names to add to the ASG"
}

variable "termination_policies" {
  type        = list(string)
  description = "Policy to decide how the instances are to be terminated"
}

variable "vpc_zone_identifier" {
  type        = list(string)
  description = "List of subnet ID's to launch into"
}

variable "health_check_type" {
  description = "health check for asg"
}

variable "asg_az" {
  description = "Availability zone for ASG"
  default  =  "eu-west-1b"
}

variable "ebs_name" {
  description = "EBS name tag value"
  type        = string
}

variable "application" {
  description = "EBS application tag value"
  type        = string
}

