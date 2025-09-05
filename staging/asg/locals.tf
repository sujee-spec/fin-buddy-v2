locals {
  region = "ap-south-1"
  default_tags = {
    ManagedBy = "Terraform"
  }

  asg_name                          = "staging-asg"
  asg_desired_capacity              = 2
  asg_min_size                      = 0
  asg_max_size                      = 2
  asg_launch_template_image_id      = data.aws_ami.ecs_optimized_amzn2.image_id
  asg_launch_template_instance_type = "t2.micro"
  asg_launch_template_version       = "$Latest"
  asg_iam_role_policy_attachments = [
    "arn:aws:iam::aws:policy/service-role/AmazonEC2ContainerServiceforEC2Role",
    "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore",
    "arn:aws:iam::aws:policy/AmazonDynamoDBFullAccess"
  ]

  # VPC
  vpc_name = "staging-vpc"

  # ECS Cluster
  cluster_name = "trezo"
}
