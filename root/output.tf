output "organization_info" {
  description = "Info about the existing AWS Organization"
  value = {
    id   = data.aws_organizations_organization.this.id
    arn  = data.aws_organizations_organization.this.arn
  }
}