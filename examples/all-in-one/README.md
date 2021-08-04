# All account assignments in a single module

Define all account assignments in a single module.

## Usage

To run this example you need to execute:

```bash
$ terraform init
$ terraform plan
$ terraform apply
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.7 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >=3.24.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | 3.24.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_all_assignments"></a> [all\_assignments](#module\_all\_assignments) | ../.. | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_organizations_organization.organization](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/organizations_organization) | data source |
| [aws_ssoadmin_instances.instances](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/ssoadmin_instances) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_assignments_all"></a> [assignments\_all](#input\_assignments\_all) | All of account assignments. | `map(map(map(list(string))))` | n/a | yes |
| <a name="input_sso_region"></a> [sso\_region](#input\_sso\_region) | Region of your AWS SSO instance. | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
