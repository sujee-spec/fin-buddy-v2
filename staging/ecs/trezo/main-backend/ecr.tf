module "ecr" {
  source = "terraform-aws-modules/ecr/aws"

  version = "2.2.1"

  repository_name = local.container_name

  repository_read_write_access_arns = [data.aws_iam_role.ecs_task_execution_role.arn]

  repository_lifecycle_policy = jsonencode({
    rules = [
      {
        rulePriority = 1,
        description  = "Expire images more than 30 count",
        selection = {
          tagStatus   = "any",
          countType   = "imageCountMoreThan",
          countNumber = 30
        },
        action = {
          type = "expire"
        }
      }
    ]
  })

  tags = {
    Name = local.container_name
  }
}
