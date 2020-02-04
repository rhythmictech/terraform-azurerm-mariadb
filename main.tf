resource "azurerm_resource_group" "mariadb_rg" {
  name     = var.resource_group_name
  location = var.location
}

resource "azurerm_mariadb_server" "mariadb_server" {
  name                = var.server_name
  location            = azurerm_resource_group.mariadb_rg.location
  resource_group_name = azurerm_resource_group.mariadb_rg.name

  sku {
    name     = var.sku_name
    capacity = var.sku_capacity
    tier     = var.sku_tier
    family   = var.sku_family
  }

  storage_profile {
    storage_mb            = var.storage_mb
    backup_retention_days = var.backup_retention_days
    geo_redundant_backup  = var.geo_redundant_backup
  }

  administrator_login          = var.administrator_login
  administrator_login_password = var.administrator_password
  version                      = var.server_version
  ssl_enforcement              = var.ssl_enforcement
}

resource "azurerm_mariadb_database" "mariadb_database" {
  name                = var.db_name
  resource_group_name = azurerm_resource_group.mariadb_rg.name
  server_name         = azurerm_mariadb_server.mariadb_server.name
  charset             = var.db_charset
  collation           = var.db_collation
}
