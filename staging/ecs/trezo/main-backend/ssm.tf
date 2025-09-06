module "ssm_parameter" {
  source = "terraform-aws-modules/ssm-parameter/aws"

  version = "1.1.1"

  name        = local.ssm_parameter_name
  description = local.ssm_parameter_description
  value       = local.container_name

  tags = {
    Name = local.ssm_parameter_name
  }
}
