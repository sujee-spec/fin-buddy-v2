data "aws_iam_role" "ecs_task_execution_role" {
  name = "ecs-task-execution-role"
}

data "aws_vpc" "staging" {
  filter {
    name   = "tag:Name"
    values = [local.vpc_name]
  }
}

data "aws_subnets" "private" {
  filter {
    name   = "tag:Name"
    values = ["${local.vpc_name}-private-*"]
  }
}

data "aws_ssm_parameters_by_path" "main_backend" {
  path = local.ssm_parameter_name
}

data "aws_lb" "external_alpha" {
  name = "external-alpha"
}

data "aws_ecr_image" "backend" {
  depends_on      = [module.ecr]
  registry_id     = module.ecr.repository_registry_id
  repository_name = local.container_name
  most_recent     = true
}
