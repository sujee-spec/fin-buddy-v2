module "cluster" {
  source  = "infraspecdev/ecs/aws//modules/cluster"
  version = "~> 1.4.0"

  name = local.cluster_name
  setting = [
    {
      name  = "containerInsights"
      value = "enabled"
    }
  ]
  service_connect_namespace = local.cluster_service_connect_namespace
}

resource "aws_ecs_cluster_capacity_providers" "fargate" {
  cluster_name       = module.cluster.name
  capacity_providers = [local.capacity_provider_name]

  default_capacity_provider_strategy {
    capacity_provider = local.capacity_provider_name
    weight            = 100
    base              = 0
  }
}
