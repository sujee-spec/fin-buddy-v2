module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "staging-vpc"
  cidr = "172.31.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b"]

  public_subnets  = ["172.31.0.0/20", "172.31.0.0/20"]
  private_subnets = ["172.31.0.0/20", "172.31.0.0/20"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}
