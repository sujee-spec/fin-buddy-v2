data "aws_organizations_organization" "this" {}

data "aws_organizations_organizational_units" "root" {
  parent_id = data.aws_organizations_organization.this.roots[0].id
}

data "aws_s3_bucket" "production" {
  provider = aws.production
  bucket   = "sujeet-fin-buddy-s3"
}
