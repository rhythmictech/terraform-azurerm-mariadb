output "resource_group_name" {
  description = "Name of MariaDB server resource group"
  value       = azurerm_resource_group.mariadb_rg.name
}

output "server_name" {
  description = "Name of MariaDB server"
  value       = azurerm_mariadb_server.mariadb_server.name
}

output "administrator_login" {
  description = "Administrative user name of MariaDB server"
  value       = local.administrator_login
}

output "administrator_password" {
  description = "Password for administrative user name of MariaDB server"
  value       = local.administrator_password
  sensitive   = true
}

output "server_id" {
  description = "ID of MariaDB server"
  value       = azurerm_mariadb_server.mariadb_server.id
}

output "server_fqdn" {
  description = "FQDN of MariaDB server"
  value       = azurerm_mariadb_server.mariadb_server.fqdn
}
