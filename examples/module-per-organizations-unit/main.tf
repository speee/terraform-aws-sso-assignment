data "aws_ssoadmin_instances" "instances" {}

data "aws_organizations_organization" "organization" {}

locals {
  instance_arn      = tolist(data.aws_ssoadmin_instances.instances.arns)[0]
  identity_store_id = tolist(data.aws_ssoadmin_instances.instances.identity_store_ids)[0]
  accounts          = data.aws_organizations_organization.organization.accounts
}

module "ou1_assignments" {
  source = "../.."

  instance_arn      = local.instance_arn
  identity_store_id = local.identity_store_id

  organization_accounts = local.accounts

  assignments = var.assignments_ou1
}

module "ou2_assignments" {
  source = "../.."

  instance_arn      = local.instance_arn
  identity_store_id = local.identity_store_id

  organization_accounts = local.accounts

  assignments = var.assignments_ou2
}
