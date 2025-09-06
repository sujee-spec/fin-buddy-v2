resource "aws_security_group" "ecs_service" {
  name        = "${local.container_name}-sg"
  description = "ECS ${local.container_name} service sg"
  vpc_id      = local.vpc_id

  ingress {
    from_port   = local.container_port
    to_port     = local.container_port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
