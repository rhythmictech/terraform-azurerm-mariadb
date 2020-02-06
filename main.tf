########################################
# Optional Resources
########################################
resource "random_pet" "name" {
  length    = 3
  separator = "-"
}

resource "random_password" "db_password" {
  count = var.administrator_password == "" ? 1 : 0

  length           = 16
  special          = true
  override_special = "_%@"
}

locals {
  administrator_password   = var.administrator_password == "" ? random_password.db_password[0].result : var.administrator_password
  name                     = var.name == "" ? random_pet.name.id : var.name
  administrator_login_long = var.administrator_login == "" ? random_pet.name.id : var.administrator_login
  administrator_login      = substr(local.administrator_login_long, 0, 16)
}

module "tags" {
  source  = "rhythmictech/tags/terraform"
  version = "1.0.0"

  enforce_case = "UPPER"
  tags         = var.tags
  names = [
    local.name
  ]
}

########################################
# MariaDB things
########################################
resource "azurerm_resource_group" "mariadb" {
  name     = "${local.name}-RG"
  location = var.location
  tags     = module.tags.tags
}

resource "azurerm_mariadb_server" "server" {
  name                         = lower("${local.name}-MARIADB-SRVR")
  location                     = azurerm_resource_group.mariadb.location
  resource_group_name          = azurerm_resource_group.mariadb.name
  sku_name                     = var.sku_name
  administrator_login          = local.administrator_login
  administrator_login_password = local.administrator_password
  version                      = var.server_version
  ssl_enforcement              = var.ssl_enforcement
  tags                         = module.tags.tags

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
    auto_grow             = var.auto_grow
  }
}

resource "azurerm_mariadb_database" "database" {
  for_each = var.dbs

  name                = each.value.name
  charset             = lookup(each.value, "charset", "utf8")
  collation           = lookup(each.value, "collation", "utf8_unicode_ci")
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.server.name
}

resource "azurerm_mariadb_firewall_rule" "firewall_rule" {
  for_each = var.firewall_rules

  name                = each.key
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.server.name
}

resource "azurerm_mariadb_virtual_network_rule" "vnet_rule" {
  for_each = var.vnet_rules

  name                = each.key
  subnet_id           = each.value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.server.name
}

resource "azurerm_mariadb_configuration" "config" {
  for_each = var.mariadb_configurations

  name                = each.key
  value               = each.value
  resource_group_name = var.resource_group_name
  server_name         = azurerm_mariadb_server.server.name
}
