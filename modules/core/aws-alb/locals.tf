locals {
  create_bucket = var.bucket_name == ""
  log_bucket    = var.alb_enable_logging ? local.create_bucket : false
}