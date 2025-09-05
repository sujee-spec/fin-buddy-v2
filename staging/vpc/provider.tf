# variable "staging_account_id" {
#   description = "AWS account ID for staging"
#   type        = string
# }

provider "aws" {
  region = "ap-south-1"

  # assume_role {
  #   role_arn = "arn:aws:iam::${var.staging_account_id}:role/OrganizationAccountAccessRole"
  # }

  default_tags {
    tags = {
      ManagedBy = "Terraform"
    }
  }
}
