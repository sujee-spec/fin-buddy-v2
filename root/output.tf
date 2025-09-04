output "organization_info" {
  description = "Info about the existing AWS Organization"
  value = {
    id  = data.aws_organizations_organization.this.id
    arn = data.aws_organizations_organization.this.arn
  }
}

output "state_bucket_name" {
  value = aws_s3_bucket.terraform_state.bucket
}
