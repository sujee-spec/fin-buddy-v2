module "application_ou" {
  source                   = "github.com/infraspecdev/terraform-aws-organizational-unit?ref=main"
  organizational_unit_name = "Workload"
}
