data "aws_caller_identity" "current" {}
data "aws_vpc" "staging" {
  filter {
    name   = "tag:Name"
    values = [local.vpc_name]
  }
}

data "aws_iam_policy_document" "ecs_task_execution" {
  statement {
    sid = "AllowECRAndLogsActions"
    actions = [
      "ecr:GetAuthorizationToken",
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
    ]
    effect    = "Allow"
    resources = ["*"]
  }

  statement {
    sid = "AllowECRAccessFromSpecificVPC"
    actions = [
      "ecr:BatchCheckLayerAvailability",
      "ecr:GetDownloadUrlForLayer",
      "ecr:BatchGetImage",
    ]
    effect    = "Allow"
    resources = ["*"]
    condition {
      test     = "StringEquals"
      variable = "aws:sourceVpc"
      values   = [data.aws_vpc.staging.id]
    }
  }

  statement {
    sid = "AllowECSAccessSSMSMAndKMS"
    actions = [
      "ssm:GetParameters",
      "secretsmanager:GetSecretValue",
      "kms:Decrypt"
    ]
    effect = "Allow"
    resources = [
      "arn:aws:ssm:${local.region}:${data.aws_caller_identity.current.account_id}:parameter/*",
      "arn:aws:secretsmanager:${local.region}:${data.aws_caller_identity.current.account_id}:secret:*",
      "arn:aws:kms:${local.region}:${data.aws_caller_identity.current.account_id}:key/*"
    ]
  }
}

data "aws_iam_policy_document" "task_exec_assume" {
  statement {
    sid     = "ECSTaskExecutionAssumeRole"
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ecs-tasks.amazonaws.com"]
    }
  }
}
