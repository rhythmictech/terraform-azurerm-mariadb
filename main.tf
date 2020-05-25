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
resource "azurerm_resource_group" "mariadb_rg" {
  name     = "${local.name}-RG"
  location = var.location
  tags     = local.tags
}

resource "azurerm_mariadb_server" "mariadb_server" {
  name                         = lower("${local.name}-MARIADB-SRVR")
  location                     = azurerm_resource_group.mariadb_rg.location
  resource_group_name          = azurerm_resource_group.mariadb_rg.name
  sku_name                     = var.sku_name
  administrator_login          = local.administrator_login
  administrator_login_password = local.administrator_password
  version                      = var.server_version
  ssl_enforcement              = var.ssl_enforcement
  tags                         = local.tags

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
  resource_group_name = azurerm_resource_group.mariadb_rg.name
  server_name         = azurerm_mariadb_server.mariadb_server.name
}

resource "azurerm_mariadb_firewall_rule" "firewall_rule" {
  for_each = var.firewall_rules

  name                = each.key
  start_ip_address    = each.value.start_ip
  end_ip_address      = each.value.end_ip
  resource_group_name = azurerm_resource_group.mariadb_rg.name
  server_name         = azurerm_mariadb_server.mariadb_server.name
}

resource "azurerm_mariadb_virtual_network_rule" "vnet_rule" {
  for_each = var.vnet_rules

  name                = each.key
  subnet_id           = each.value
  resource_group_name = azurerm_resource_group.mariadb_rg.name
  server_name         = azurerm_mariadb_server.mariadb_server.name
}

resource "azurerm_mariadb_configuration" "config" {
  for_each = var.mariadb_configurations

  name                = each.key
  value               = each.value
  resource_group_name = azurerm_resource_group.mariadb_rg.name
  server_name         = azurerm_mariadb_server.mariadb_server.name
}

########################################
# Monitoring
########################################
resource "azurerm_monitor_metric_alert" "mariadb" {
  for_each            = var.monitor_metric_alert_criteria
  name                = "${local.name}-${upper(each.key)}"
  resource_group_name = azurerm_resource_group.mariadb_rg.name
  scopes              = [azurerm_mariadb_server.mariadb_server.id]
  tags                = local.tags

  action {
    action_group_id = var.monitor_action_group_id
  }

  # see https://docs.microsoft.com/en-us/azure/azure-monitor/platform/metrics-supported
  criteria {
    aggregation      = each.value.aggregation
    metric_namespace = "Microsoft.DBforMariaDB/servers"
    metric_name      = each.value.metric_name
    operator         = each.value.operator
    threshold        = each.value.threshold

    dynamic "dimension" {
      for_each = each.value.dimension
      content {
        name     = dimension.value.name
        operator = dimension.value.operator
        values   = dimension.value.value
      }
    }
  }
}
