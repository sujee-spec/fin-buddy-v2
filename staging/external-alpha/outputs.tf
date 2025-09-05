output "external_alpha_alb_id" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.id
}

output "external_alpha_alb_arn" {
  description = "The ID and ARN of the load balancer we created"
  value       = module.alb.arn
}

