<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.8.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.51.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 5.51.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_asg"></a> [asg](#module\_asg) | infraspecdev/ecs/aws//modules/asg | ~> 1.6.0 |

## Resources

| Name | Type |
|------|------|
| [aws_ami.ecs_optimized_amzn2](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ami) | data source |
| [aws_subnets.private](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/subnets) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_asg_arn"></a> [asg\_arn](#output\_asg\_arn) | ARN of the Core Autoscaling Group |
| <a name="output_asg_iam_instance_profile_arn"></a> [asg\_iam\_instance\_profile\_arn](#output\_asg\_iam\_instance\_profile\_arn) | ARN of the IAM Instance Profile for EC2 instances in Core Autoscaling Group |
| <a name="output_asg_iam_instance_profile_id"></a> [asg\_iam\_instance\_profile\_id](#output\_asg\_iam\_instance\_profile\_id) | Identifier of the IAM Instance Profile for EC2 instances in Core Autoscaling Group |
| <a name="output_asg_iam_role_id"></a> [asg\_iam\_role\_id](#output\_asg\_iam\_role\_id) | Identifier of the IAM Role for EC2 instances in Core Autoscaling Group |
| <a name="output_asg_id"></a> [asg\_id](#output\_asg\_id) | Identifier of the Core Autoscaling Group |
| <a name="output_asg_launch_template_arn"></a> [asg\_launch\_template\_arn](#output\_asg\_launch\_template\_arn) | ARN of the Launch Template in Core Autoscaling Group |
| <a name="output_asg_launch_template_id"></a> [asg\_launch\_template\_id](#output\_asg\_launch\_template\_id) | Identifier of the Launch Template in Core Autoscaling Group |
<!-- END_TF_DOCS -->
