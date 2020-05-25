module "prod_ec2" {
  source                     = "../../../../modules/support/service/ec2-asg-jenkins-server"
  account                    = "nonprod"
  aws_region                 = var.aws_region
  environment                = "nonprod"
  instance_listener_port     = 8080
  instance_listener_protocol = "HTTP"
  keypair                    = "mg-jenkins-nonprod"
  lb_health_check_path       = "/login?from=%2F"
  lb_health_check_port       = 8080
  lb_listener_port           = 8080
  lb_listener_protocol       = "HTTPS"
  name                       = "app"
  service_name               = "jenkins"
  ssl_certificate_arn        = "arn:aws:acm:eu-west-1:401279573739:certificate/091baa1d-4a5a-4daf-bf8e-ff1aa73f11e9"
  alb_dns                    = 1
  internal_domain            = "mgnonprod.co.uk"
  domain_name                = "jenkins-rou.mgnonprod.co.uk"
  application                = "routing-service"
  ebs_name                   = "jenkins"
  tags = {
    Name        = "mg-jenkins"
    Environment = "nonprod"
  }


}