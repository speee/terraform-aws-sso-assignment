# terraform-aws-sso-assignment

Terraform module which creates AWS SSO assignments on AWS.

## Usage
```hcl
module "account_assignments" {
  source = "speee/sso-assignments/aws"

  instance_arn      = "arn:aws:sso:::instance/ssoins-9999999999999999"
  identity_store_id = "d-9999999999"

  organization_accounts = [
    {
      arn = "arn:aws:organizations::123456789012:account/o-xxxxxxxxxx/123456789012"
      email = "account1@example.com"
      id = "123456789012"
      name = "account1"
    },
    {
      arn = "arn:aws:organizations::123456789012:account/o-xxxxxxxxxx/234567890123"
      email = "account2@example.com"
      id = "234567890123"
      name = "account2"
    },
  ]

  assignments = {
    "account1" = {
      "groups" = {
        "SystemAdministrator" = [
          "AdministratorAccess",
        ],
        "Engineer" = [
          "PowerUserAccess",
        ],
        "Manager" = [
          "ReadOnlyAccess",
        ],
      },
      "users" = {
        "alice@example.com" = [
          "AdministratorAccess",
        ],
      },
    },
    "account2" = {
      "users" = {
        "alice@example.com" = [
          "AdministratorAccess",
        ],
        "bob@example.com" = [
          "ReadOnlyAccess",
        ],
      },
    },
  }
}
```

## Examples
- [All account assignments in a single module](https://github.com/speee/terraform-aws-sso-assignment/tree/master/examples/all-in-one)
- [Account assignments per organization units](https://github.com/speee/terraform-aws-sso-assignment/tree/master/examples/module-per-organizations-unit)

## Notes
1. This module does not create no resource other than `aws_ssoadmin_account_assignment` resource. Use resources or data sources directly to manage other resources like `aws_ssoadmin_permission_set`.


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.24.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [aws_ssoadmin_account_assignment.groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |
| [aws_ssoadmin_account_assignment.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ssoadmin_account_assignment) | resource |
| [aws_identitystore_group.groups](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_group) | data source |
| [aws_identitystore_user.users](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/identitystore_user) | data source |
| [aws_ssoadmin_permission_set.permission_sets](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_permission_set) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignments"></a> [assignments](#input\_assignments) | Configuration variable for account assignments. | `map(map(map(list(string))))` | n/a | yes |
| <a name="input_identity_store_id"></a> [identity\_store\_id](#input\_identity\_store\_id) | The Identity Store ID associated with the Single Sign-On Instance. | `string` | n/a | yes |
| <a name="input_instance_arn"></a> [instance\_arn](#input\_instance\_arn) | The Amazon Resource Name (ARN) of the SSO Instance under which the operation will be executed. | `string` | n/a | yes |
| <a name="input_organization_accounts"></a> [organization\_accounts](#input\_organization\_accounts) | List of information of accounts which belongs to AWS Organizations. | <pre>list(object({<br>    arn   = string<br>    email = string<br>    id    = string<br>    name  = string<br>  }))</pre> | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
