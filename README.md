# terraform-azurerm-template
[![](https://github.com/rhythmictech/terraform-azurerm-template/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-azurerm-template/actions)

Template repo for Azure module


<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| administrator\_login | The Administrator Login for the MariaDB Server. Changing this forces a new resource to be created. | `any` | n/a | yes |
| administrator\_password | The Password associated with the administrator\_login for the MariaDB Server. | `any` | n/a | yes |
| backup\_retention\_days | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `7` | no |
| db\_charset | Specifies the Charset for the MariaDB Database, which needs to be a valid MariaDB Charset. | `string` | `"utf8"` | no |
| db\_collation | Specifies the Collation for the MariaDB Database, which needs to be a valid MariaDB Collation. | `string` | `"utf8_general_ci"` | no |
| db\_name | The list of names of the MariaDB Database, which needs to be a valid MariaDB. | `string` | `"defaultDB"` | no |
| geo\_redundant\_backup | Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier. | `string` | `"Disabled"` | no |
| location | Specifies the supported Azure location where the resource exists. | `any` | n/a | yes |
| resource\_group\_name | The name of the resource group in which to create the MariaDB Server. | `any` | n/a | yes |
| server\_name | Specifies the name of the MariaDB Server. | `any` | n/a | yes |
| server\_version | Specifies the version of MariaDB to use. | `string` | `"10.2"` | no |
| sku\_capacity | The scale up/out capacity, representing server's compute units | `string` | `"2"` | no |
| sku\_family | The family of hardware Gen4 or Gen5. | `string` | `"Gen5"` | no |
| sku\_name | Specifies the SKU Name for this MariaDB Server. | `string` | `"B_Gen5_2"` | no |
| sku\_tier | The tier of the particular SKU. Possible values are Basic, GeneralPurpose, and MemoryOptimized. | `string` | `"Basic"` | no |
| ssl\_enforcement | Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled. | `string` | `"Enabled"` | no |
| storage\_mb | Max storage allowed for a server. Possible values are between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU and between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs. | `number` | `5120` | no |

## Outputs

| Name | Description |
|------|-------------|
| administrator\_login | n/a |
| administrator\_password | n/a |
| db\_name | n/a |
| server\_id | n/a |
| server\_name | n/a |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
