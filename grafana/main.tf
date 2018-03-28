provider "aws" {
  region = "us-west-2"
}

terraform {
  backend "s3" {
    bucket = "hbpcb-terraform"
    key = "grafana/terraform.tfstate"
    region = "us-west-2"
  }
}

data "terraform_remote_state" "dns" {
  backend = "s3"
  config {
    bucket = "hbpcb-terraform"
    key    = "dns/terraform.tfstate"
    region = "us-west-2"
  }
}

resource "aws_route53_record" "grafana" {
  zone_id = "${ data.terraform_remote_state.dns.private_zone }"
  name = "grafana.homebrewpcb.com"
  type = "CNAME"
  ttl = "300"
  records = [ "grafana.homebrewpcb.com" ]
}
