data "aws_organizations_organization" "this" {}

data "aws_organizations_organizational_units" "root" {
  parent_id = data.aws_organizations_organization.this.roots[0].id
}

data "aws_s3_bucket" "core" {
  provider = aws.core
  bucket   = "core-iac-remote-state"
}
