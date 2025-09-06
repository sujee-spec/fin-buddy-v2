locals {
  region = "ap-south-1"
  default_tags = {
    ManagedBy = "Terraform"
  }

  # Cluster
  cluster_name                      = "trezo"
  cluster_service_connect_namespace = data.aws_service_discovery_http_namespace.trezo.arn

  # Cluster Capacity Providers
  capacity_provider_name = "FARGATE"
}
