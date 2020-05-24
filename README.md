# terraform-azurerm-mariadb
[![](https://github.com/rhythmictech/terraform-azurerm-mariadb/workflows/check/badge.svg)](https://github.com/rhythmictech/terraform-azurerm-mariadb/actions)

Batteries-included MariaDB on Azure

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12 |

## Providers

| Name | Version |
|------|---------|
| azurerm | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| administrator\_login | The Administrator Login for the MariaDB Server. Changing this forces a new resource to be created. | `string` | `""` | no |
| administrator\_password | The Password associated with the administrator\_login for the MariaDB Server. | `string` | `""` | no |
| auto\_grow | Whether autogrow is enabled | `string` | `"Enabled"` | no |
| backup\_retention\_days | Backup retention days for the server, supported values are between 7 and 35 days. | `number` | `7` | no |
| charset | Specifies the Charset for the MariaDB Database, which needs to be a valid MariaDB Charset. | `string` | `"utf8"` | no |
| collation | Specifies the Collation for the MariaDB Database, which needs to be a valid MariaDB Collation. | `string` | `"utf8_general_ci"` | no |
| dbs | Map of databases to create, values supported: name, charset, collation | `map` | `{}` | no |
| firewall\_rules | Map of firewall rules to create. Key is rule name, values are start\_ip, end\_ip | `map` | `{}` | no |
| geo\_redundant\_backup | Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier. | `string` | `"Disabled"` | no |
| location | Specifies the supported Azure location where the resource exists. | `string` | `"eastus"` | no |
| mariadb\_configurations | Map of MariaDB configuration settings to create. Key is name, value is value. See mariadb.com/kb/en/server-system-variables/ | `map` | `{}` | no |
| monitor\_action\_group\_id | ID of Azure Monitor Action Group for metric to trigger | `string` | `""` | no |
| monitor\_metric\_alert\_criteria | Map of name = criteria objects | <pre>map(object({<br>    # criteria.*.aggregation to be one of [Average Count Minimum Maximum Total]<br>    aggregation = string<br>    metric_name = string<br>    # criteria.0.operator to be one of [Equals NotEquals GreaterThan GreaterThanOrEqual LessThan LessThanOrEqual]<br>    operator  = string<br>    threshold = number<br><br>    dimension = object({<br>      name     = string<br>      operator = string<br>      values   = list(string)<br>    })<br>  }))</pre> | `{}` | no |
| name | The name of the resource group in which to create the MariaDB Server. | `string` | `""` | no |
| server\_version | Specifies the version of MariaDB to use. | `string` | `"10.3"` | no |
| sku\_name | Specifies the SKU Name for this MariaDB Server. | `string` | `"B_Gen5_2"` | no |
| ssl\_enforcement | Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled. | `string` | `"Enabled"` | no |
| storage\_mb | Max storage allowed for a server. Possible values are:<br>      - between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU<br>      - between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs | `number` | `5120` | no |
| tags | Tags to apply to all resources | `map(string)` | `{}` | no |
| vnet\_rules | Map of vnet rules to create. Key is name, value is vnet id | `map` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| administrator\_login | Administrative user name of MariaDB server |
| administrator\_password | Password for administrative user name of MariaDB server |
| monitor\_metric\_alerts | List Azure Monitor Metric Alert resources for the MariaDB Server |
| resource\_group\_name | Name of MariaDB server resource group |
| server\_fqdn | FQDN of MariaDB server |
| server\_id | ID of MariaDB server |
| server\_name | Name of MariaDB server |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
