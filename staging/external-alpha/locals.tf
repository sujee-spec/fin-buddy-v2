locals {
  region = "ap-south-1"
  default_tags = {
    ManagedBy = "Terraform"
  }

  public_subnets_ids = data.aws_subnets.public.ids
  vpc_id             = data.aws_vpc.staging.id
  vpc_cidr_block     = data.aws_vpc.staging.cidr_block

  lb_name  = "external-alpha"
  vpc_name = "staging-vpc"
}
