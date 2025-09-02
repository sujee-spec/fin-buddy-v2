locals {
  account_name              = "staging"
  staging_s3_tf_policy_name = "stage-terraform-bucket-access"

  workload_ou_id = [for x in data.aws_organizations_organizational_units.root.children : x.id if x.name == "Workload"][0]
}

module "aws_organizations_account" {
  source = "github.com/infraspecdev/terraform-aws-account?ref=main"

  account_name               = local.account_name
  account_email              = "sksujeet512+2@gmail.com"
  parent_org_id              = local.workload_ou_id
  close_on_deletion          = true
  iam_user_access_to_billing = "DENY"

  providers = {
    aws = aws.root
  }
}

module "github_actions_iam_role" {
  source  = "infraspecdev/github-action-iam-role/aws"
  version = ">= 1.0"

  role_name        = "${local.account_name}-terraform-gh-role"
  aws_account_id   = module.aws_organizations_account.account_id
  github_username  = "sujeet32"
  repository_names = ["fin-buddy-v2"]

  providers = {
    aws = aws.staging
  }
  depends_on = [
    module.aws_organizations_account
  ]
}

resource "aws_iam_role_policy" "staging_s3_access" {
  provider   = aws.staging
  name       = local.staging_s3_tf_policy_name
  role       = "${local.account_name}-terraform-gh-role"
  depends_on = [module.github_actions_iam_role]

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "VisualEditor0"
        Effect = "Allow"
        Action = [
          "s3:PutObject",
          "s3:DeleteObject",
          "s3:GetObject",
          "s3:ListBucket"
        ]
        Resource = [
          data.aws_s3_bucket.staging.arn,
          "${data.aws_s3_bucket.staging.arn}/*",
        ]
      }
    ]
  })
}
