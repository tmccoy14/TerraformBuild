# Provide the required Terraform version
terraform {
  required_version = "~> 0.12.0"
}

# Provide provider profile and region
provider "aws" {
  profile = "studio_mfa"
  region  = "us-east-1"
}

# Create a new ec2 instance
resource "aws_instance" "terraformEC2Example" {
  ami           = var.ami
  instance_type = "t2.micro"
}

# Create a new load balancer
# ACTUAL DETAILS FOR THE LOAD BALANCER NEED TO BE CONFIGURED BUT FOR NOW THIS IS FINE
resource "aws_elb" "terraformELBExample" {
  name               = "terraform-elb"
  availability_zones = ["us-east-1a"]

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  instances                   = [aws_instance.terraformEC2Example.id]
  cross_zone_load_balancing   = true
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}

# Create a new route 53 record
# ACTUAL DETAILS FOR THE ROUTE 53 RECORD NEED TO BE CONFIGURED BUT FOR NOW THIS IS FINE AS WELL
resource "aws_route53_record" "apps_record" {
  zone_id = var.route53
  name    = "terraform.route53"
  type    = "A"

  alias {
    name                   = aws_elb.terraformELBExample.dns_name
    zone_id                = aws_elb.terraformELBExample.zone_id
    evaluate_target_health = true
  }
}
