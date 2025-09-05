data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["${local.vpc_name}-private-*"]
  }
}

data "aws_ami" "ecs_optimized_amzn2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "name"
    values = ["amzn2-ami-ecs-hvm-*-x86_64-ebs"]
  }
}
