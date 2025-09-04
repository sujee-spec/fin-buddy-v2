module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "staging-vpc"
  cidr = "172.30.0.0/16"

  azs = ["ap-south-1a", "ap-south-1b"]

  public_subnets  = ["172.30.1.0/24", "172.30.2.0/24"]
  private_subnets = ["172.30.3.0/24", "172.30.4.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}