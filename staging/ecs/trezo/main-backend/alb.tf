resource "aws_lb_target_group" "main_backend" {
  port        = local.container_port
  protocol    = "HTTP"
  target_type = "ip"
  vpc_id      = local.vpc_id

  health_check {
    enabled  = true
    path     = "/up"
    port     = "traffic-port"
    protocol = "HTTP"
  }

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_lb_listener" "main_backend" {
  load_balancer_arn = data.aws_lb.external_alpha.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type = "fixed-response"

    fixed_response {
      content_type = "text/plain"
      message_body = "Fixed response content"
      status_code  = "200"
    }
  }

}

resource "aws_lb_listener_rule" "main_backend_path_based_routing" {
  listener_arn = aws_lb_listener.main_backend.arn
  priority     = 1

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main_backend.arn
  }

  condition {
    path_pattern {
      values = ["/*"]
    }
  }
}
