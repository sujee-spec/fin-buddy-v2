module "s3_bucket_for_logs" {
  source = "terraform-aws-modules/s3-bucket/aws"

  bucket_prefix = "${local.lb_name}-logs-"
  acl           = "log-delivery-write"

  force_destroy = true

  control_object_ownership = true
  object_ownership         = "ObjectWriter"

  attach_elb_log_delivery_policy = true # Required for ALB logs
  attach_lb_log_delivery_policy  = true # Required for ALB/NLB logs


  attach_deny_insecure_transport_policy = true
  attach_require_latest_tls_policy      = true
}

module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "~> 9.0"

  name = local.lb_name

  load_balancer_type = "application"

  vpc_id  = local.vpc_id
  subnets = local.public_subnets_ids

  enable_deletion_protection = false

  # Security Group
  security_group_ingress_rules = {
    all_http = {
      from_port   = 80
      to_port     = 80
      ip_protocol = "tcp"
      description = "HTTP web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
    all_https = {
      from_port   = 443
      to_port     = 443
      ip_protocol = "tcp"
      description = "HTTPS web traffic"
      cidr_ipv4   = "0.0.0.0/0"
    }
  }
  security_group_egress_rules = {
    all = {
      ip_protocol = "-1"
      cidr_ipv4   = local.vpc_cidr_block
    }
  }

  access_logs = {
    bucket = module.s3_bucket_for_logs.s3_bucket_id
    prefix = "access-logs"
  }

  connection_logs = {
    bucket  = module.s3_bucket_for_logs.s3_bucket_id
    enabled = true
    prefix  = "connection-logs"
  }

  client_keep_alive = 7200

}
