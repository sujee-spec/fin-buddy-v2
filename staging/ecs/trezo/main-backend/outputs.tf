output "backend_ecr_repository_name" {
  description = "Name of the repository"
  value       = module.ecr.repository_name
}

output "backend_ecr_repository_arn" {
  description = "Full ARN of the repository"
  value       = module.ecr.repository_arn
}

output "backend_ecr_repository_registry_id" {
  description = "The registry ID where the repository was created"
  value       = module.ecr.repository_registry_id
}

output "backend_ecr_repository_url" {
  description = "The registry ID where the repository was created"
  value       = module.ecr.repository_url
}

output "main_backend_service_id" {
  description = "ARN that identifies the service"
  value       = module.ecs_deployment.ecs_service_arn
}

output "main_backend_ssm_parameter_name" {
  description = "SSM Parameter Name for main-backend service"
  value       = module.ssm_parameter.ssm_parameter_name
}

output "main_backend_ssm_parameter_arn" {
  description = "ARN that identifies the main-backend ssm parameter"
  value       = module.ssm_parameter.ssm_parameter_arn
}


