module "ecs_deployment" {
  source  = "infraspecdev/ecs-deployment/aws"
  version = "~> 4.3.1"

  vpc_id       = local.vpc_id
  cluster_name = local.cluster_name

  # ECS Service
  service = {
    name          = local.container_name
    desired_count = 1

    load_balancer = [
      {
        target_group_arn = aws_lb_target_group.main_backend.arn
        container_name   = local.container_name
        container_port   = local.container_port
      }
    ]

    network_configuration = {
      subnets         = local.private_subnets_ids
      security_groups = [aws_security_group.ecs_service.id]
    }

    service_connect_configuration = {
      enabled   = true
      namespace = local.namespace

      log_configuration = {
        log_driver = "awslogs"
        options = {
          "awslogs-create-group"  = "true"
          "awslogs-group"         = "/ecs/${local.cluster_name}/${local.container_name}/tf-svc-connect"
          "awslogs-region"        = local.region
          "awslogs-stream-prefix" = "ecs"
        }
      }

      service = [
        {
          port_name      = local.container_name
          discovery_name = local.container_name

          client_alias = {
            port     = local.container_port
            dns_name = local.container_name
          }

          timeout = {
            idle_timeout_seconds        = 60
            per_request_timeout_seconds = 60
          }
        }
      ]
    }

    deployment_circuit_breaker = {
      enable   = true
      rollback = true
    }

    tags = {
      Name      = local.container_name
      Namespace = local.namespace
    }
  }

  # ECS Task Definition
  task_definition = {
    family = local.container_name

    cpu                = 512
    memory             = 512
    execution_role_arn = data.aws_iam_role.ecs_task_execution_role.arn

    runtime_platform = {
      operating_system_family = "LINUX"
      cpu_architecture        = "X86_64"
    }

    container_definitions = [
      {
        name                   = local.container_name
        image                  = local.image_uri
        cpu                    = 512
        memory                 = 512
        essential              = true
        readonlyRootFilesystem = false

        portMappings = [
          {
            name          = local.container_name
            containerPort = local.container_port
            protocol      = "tcp"
            appProtocol   = "http"
          }
        ]

        logConfiguration = {
          logDriver = "awslogs"
          options = {
            awslogs-create-group  = "true"
            awslogs-group         = "/ecs/${local.cluster_name}/${local.container_name}"
            awslogs-region        = local.region
            awslogs-stream-prefix = "ecs"
          }
        }

        secrets = local.container_secrets
      }
    ]
  }

  # ECS Capacity Provider
  create_capacity_provider = false

  # Application Load Balancer
  create_alb = false

  # ACM Certificates
  create_acm = false
}
