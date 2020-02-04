# terraform-azurerm-mariadb
[![](https://github.com/rhythmictech/terraform-azurerm-mariadb/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-azurerm-mariadb/actions)

Batteries-included MariaDB on Azure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| administrator\_login | The Administrator Login for the MariaDB Server. Changing this forces a new resource to be created. | `string` | `""` | no |
| administrator\_password | The Password associated with the administrator\_login for the MariaDB Server. | `string` | `""` | no |
| auto\_grow | Whether autogrow is enabled | `string` | `"Enabled"` | no |
| backup\_retention\_days | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `7` | no |
| db\_charset | Specifies the Charset for the MariaDB Database, which needs to be a valid MariaDB Charset. | `string` | `"utf8"` | no |
| db\_collation | Specifies the Collation for the MariaDB Database, which needs to be a valid MariaDB Collation. | `string` | `"utf8_general_ci"` | no |
| db\_name | The list of names of the MariaDB Database, which needs to be a valid MariaDB. | `string` | `"defaultDB"` | no |
| geo\_redundant\_backup | Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier. | `string` | `"Disabled"` | no |
| location | Specifies the supported Azure location where the resource exists. | `string` | `"eastus"` | no |
| name | The name of the resource group in which to create the MariaDB Server. | `string` | `""` | no |
| server\_version | Specifies the version of MariaDB to use. | `string` | `"10.3"` | no |
| sku\_name | Specifies the SKU Name for this MariaDB Server. | `string` | `"B_Gen5_2"` | no |
| ssl\_enforcement | Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled. | `string` | `"Enabled"` | no |
| storage\_mb | Max storage allowed for a server. Possible values are:<br>      - between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU<br>      - between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs | `number` | `5120` | no |
| tags | Tags to apply to all resources | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| administrator\_login | Administrative user name of MariaDB server |
| administrator\_password | Password for administrative user name of MariaDB server |
| db\_name | Name of MariaDB database |
| server\_fqdn | FQDN of MariaDB server |
| server\_id | ID of MariaDB server |
| server\_name | Name of MariaDB server |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
