module "asg" {
  source  = "infraspecdev/ecs/aws//modules/asg"
  version = "~> 1.6.0"

  cluster_name = local.cluster_name

  name                  = local.asg_name
  health_check_type     = "EC2"
  desired_capacity      = local.asg_desired_capacity //2
  min_size              = local.asg_min_size         //0
  max_size              = local.asg_max_size         //2
  vpc_zone_identifier   = data.aws_subnets.private.ids
  protect_from_scale_in = false

  launch_template = {
    name                   = "${local.asg_name}-launch-template"
    image_id               = local.asg_launch_template_image_id
    instance_type          = local.asg_launch_template_instance_type
    vpc_security_group_ids = []
    user_data              = <<-EOT
      #!/bin/bash

      cat <<'EOF' >> /etc/ecs/ecs.config
      ECS_CLUSTER=${local.cluster_name}
      ECS_ENABLE_AWSLOGS_EXECUTIONROLE_OVERRIDE=true
      ECS_AVAILABLE_LOGGING_DRIVERS=["json-file","awslogs","logentries"]
      EOF
    EOT
  }
  launch_template_version = local.asg_launch_template_version

  iam_role_name               = "${local.asg_name}-instance-role"
  iam_role_policy_attachments = local.asg_iam_role_policy_attachments
  iam_instance_profile_name   = "${local.asg_name}-instance-profile"
}
