variable "name" {
  description = "The name of the resource group in which to create the MariaDB Server."
  default     = ""
  type        = string
}

variable "location" {
  description = "Specifies the supported Azure location where the resource exists."
  default     = "eastus"
  type        = string
}

variable "administrator_login" {
  description = "The Administrator Login for the MariaDB Server. Changing this forces a new resource to be created."
  default     = ""
  type        = string
}

variable "administrator_password" {
  description = "The Password associated with the administrator_login for the MariaDB Server."
  default     = ""
  type        = string
}

variable "sku_name" {
  description = "Specifies the SKU Name for this MariaDB Server."
  default     = "B_Gen5_2"
  type        = string
}

variable "storage_mb" {
  description = <<EOD
    Max storage allowed for a server. Possible values are:
      - between 5120 MB(5GB) and 1048576 MB(1TB) for the Basic SKU
      - between 5120 MB(5GB) and 4194304 MB(4TB) for General Purpose/Memory Optimized SKUs
EOD
  default     = 5120
  type        = number
}

variable "backup_retention_days" {
  description = "Backup retention days for the server, supported values are between 7 and 35 days."
  default     = 7
  type        = number
}

variable "geo_redundant_backup" {
  description = "Enable Geo-redundant or not for server backup. Valid values for this property are Enabled or Disabled, not supported for the basic tier."
  default     = "Disabled"
  type        = string
}

variable "auto_grow" {
  description = "Whether autogrow is enabled"
  default     = "Enabled"
  type        = string
}

variable "server_version" {
  description = "Specifies the version of MariaDB to use."
  default     = "10.3"
  type        = string
}

variable "ssl_enforcement" {
  description = "Specifies if SSL should be enforced on connections. Possible values are Enabled and Disabled."
  default     = "Enabled"
  type        = string
}

variable "charset" {
  description = "Specifies the Charset for the MariaDB Database, which needs to be a valid MariaDB Charset."
  default     = "utf8"
  type        = string
}

variable "collation" {
  description = "Specifies the Collation for the MariaDB Database, which needs to be a valid MariaDB Collation."
  default     = "utf8_general_ci"
  type        = string
}

variable "dbs" {
  description = "Map of databases to create, values supported: name, charset, collation"
  type        = map
  default     = {}
}

variable "firewall_rules" {
  description = "Map of firewall rules to create. Key is rule name, values are start_ip, end_ip"
  type        = map
  default     = {}
}

variable "vnet_rules" {
  description = "Map of vnet rules to create. Key is name, value is vnet id"
  type        = map
  default     = {}
}

variable "mariadb_configurations" {
  description = "Map of MariaDB configuration settings to create. Key is name, value is vnet id"
  type        = map
  default     = {}
}

variable "tags" {
  description = "Tags to apply to all resources"
  default     = {}
  type        = map(string)
}
