output "trezo_cluster_id" {
  description = "ID of the ECS Cluster"
  value       = module.cluster.id
}

output "trezo_cluster_arn" {
  description = "ARN of the ECS Cluster"
  value       = module.cluster.arn
}

output "trezo_cluster_name" {
  description = "Name of the ECS Cluster"
  value       = module.cluster.name
}

output "trezo_cluster_capacity_providers" {
  description = "Capacity providers of the ECS Cluster"
  value = {
    (aws_ecs_cluster_capacity_providers.fargate.id) = aws_ecs_cluster_capacity_providers.fargate
  }
}
