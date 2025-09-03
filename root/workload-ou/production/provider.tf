provider "aws" {
  alias  = "root"
  region = "ap-south-1"

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}

provider "aws" {
  alias  = "production"
  region = "ap-south-1"

  assume_role {
    role_arn = "arn:aws:iam::${module.aws_organizations_account.account_id}:role/OrganizationAccountAccessRole"
  }

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}