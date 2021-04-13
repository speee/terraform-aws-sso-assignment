locals {
  group   = "GROUP"
  user    = "USER"
  account = "AWS_ACCOUNT"
}

data "aws_identitystore_group" "groups" {
  for_each = toset(flatten([
    for account, v in var.assignments : [
      for group_name in keys(v.groups) : group_name
    ]
  ]))

  identity_store_id = var.identity_store_id

  filter {
    attribute_path  = "DisplayName"
    attribute_value = each.value
  }
}

data "aws_identitystore_user" "users" {
  for_each = toset(flatten([
    for account, v in var.assignments : [
      for user_name in keys(v.users) : user_name
    ]
  ]))

  identity_store_id = var.identity_store_id

  filter {
    attribute_path  = "UserName"
    attribute_value = each.value
  }
}

data "aws_ssoadmin_permission_set" "permission_sets" {
  for_each = toset(flatten([
    for account, v in var.assignments : flatten([
      for group_name, permission_sets in v.groups : [
        for permission_set_name in permission_sets : permission_set_name
      ]
    ])
  ]))

  instance_arn = var.instance_arn
  name         = each.value
}

resource "aws_ssoadmin_account_assignment" "groups" {
  for_each = merge([
    for account, v in var.assignments : merge([
      for group_name, permission_sets in v.groups : {
        for permission_set_name in permission_sets : "${account}.${group_name}.${permission_set_name}" => {
          account             = account
          group_name          = group_name
          permission_set_name = permission_set_name
        }
      }
    ]...)
  ]...)

  instance_arn       = var.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.permission_sets[each.value.permission_set_name].arn

  principal_id   = data.aws_identitystore_group.groups[each.value.group_name].id
  principal_type = "GROUP"

  target_id   = [for x in var.organization_accounts : x.id if x.name == each.value.account][0]
  target_type = "AWS_ACCOUNT"
}

resource "aws_ssoadmin_account_assignment" "users" {
  for_each = merge([
    for account, v in var.assignments : merge([
      for user_name, permission_sets in v.users : {
        for permission_set_name in permission_sets : "${account}.${user_name}.${permission_set_name}" => {
          account             = account
          user_name           = user_name
          permission_set_name = permission_set_name
        }
      }
    ]...)
  ]...)

  instance_arn       = var.instance_arn
  permission_set_arn = data.aws_ssoadmin_permission_set.permission_sets[each.value.permission_set_name].arn

  principal_id   = data.aws_identitystore_user.users[each.value.user_name].id
  principal_type = "USER"

  target_id   = [for x in var.organization_accounts : x.id if x.name == each.value.account][0]
  target_type = "AWS_ACCOUNT"
}
