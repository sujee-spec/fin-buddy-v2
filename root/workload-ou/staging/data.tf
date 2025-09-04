data "aws_organizations_organization" "this" {
  provider = aws.root
}

data "aws_organizations_organizational_units" "root" {
  provider  = aws.root
  parent_id = data.aws_organizations_organization.this.roots[0].id
}

data "aws_s3_bucket" "tf_state" {
  provider = aws.root
  bucket   = "sujeet-fin-buddy-s3"
}
