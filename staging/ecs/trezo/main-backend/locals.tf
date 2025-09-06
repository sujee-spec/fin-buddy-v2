locals {
  region = "ap-south-1"
  default_tags = {
    ManagedBy   = "Terraform"
    Environment = "Staging"
  }

  vpc_id         = data.aws_vpc.staging.id
  vpc_name       = "staging-vpc"
  cluster_name   = "trezo"
  container_name = "main-backend"
  container_port = 7070
  namespace      = "trezo"

  # image_uri           = "${module.ecr.repository_url}:${data.aws_ecr_image.backend.image_tags[0]}"
  image_uri           = "public.ecr.aws/nginx/nginx:latest" //temp fix -> will need to upload the code for the image
  private_subnets_ids = data.aws_subnets.private.ids

  ssm_parameter_name        = "/trezo/main-backend"
  ssm_parameter_description = "Parameters for main-backend service"

  container_secrets = concat(
    [
      for i in range(length(data.aws_ssm_parameters_by_path.main_backend.names)) : {
        name      = trimspace(replace(data.aws_ssm_parameters_by_path.main_backend.names[i], "//*${data.aws_ssm_parameters_by_path.main_backend.path}/*/", ""))
        valueFrom = data.aws_ssm_parameters_by_path.main_backend.arns[i]
      }
    ]
  )
}
