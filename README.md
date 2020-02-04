# terraform-azurerm-template
[![](https://github.com/rhythmictech/terraform-azurerm-template/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-azurerm-template/actions)

Template repo for Azure module


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| env | Environment to tag resources with | string | `"default"` | no |
| name | Moniker to apply to all resources in the module | string | n/a | yes |
| tags | User-Defined tags | map(string) | `{}` | no |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
