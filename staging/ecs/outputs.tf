output "ecs_task_execution_policy_arn" {
  description = "ARN of the ECS Task Execution Policy"
  value       = aws_iam_policy.ecs_task_execution.arn
}
output "ecs_task_execution_role_arn" {
  description = "ARN of the ECS Task Execution role"
  value       = aws_iam_role.task_exec.arn
}

output "trezo_namespace_id" {
  description = "ID of the HTTP namespace for service discovery"
  value       = aws_service_discovery_http_namespace.trezo.id
}

output "trezo_namespace_arn" {
  description = "ARN of the HTTP namespace for service discovery"
  value       = aws_service_discovery_http_namespace.trezo.arn
}
