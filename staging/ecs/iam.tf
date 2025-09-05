resource "aws_iam_policy" "ecs_task_execution" {
  name        = "ecs-task-execution-policy"
  description = "ECS Task Execution Policy"
  policy      = data.aws_iam_policy_document.ecs_task_execution.json
}


resource "aws_iam_role" "task_exec" {
  name                  = "ecs-task-execution-role"
  description           = "Task execution role for ECS"
  assume_role_policy    = data.aws_iam_policy_document.task_exec_assume.json
  force_detach_policies = true
}

resource "aws_iam_role_policy_attachment" "ecs_task_execution_attachment" {
  role       = aws_iam_role.task_exec.name
  policy_arn = aws_iam_policy.ecs_task_execution.arn
}
