output "account_arn" {
  description = "The ARN of this AWS account"
  value       = module.aws_organizations_account.account_arn
}

output "account_id" {
  description = "The ID of this AWS account"
  value       = module.aws_organizations_account.account_id
}

output "terraform_gh_role_arn" {
  description = "The ARN of the Github Actions role"
  value       = module.github_actions_iam_role.github_action_iam_role_arn
}