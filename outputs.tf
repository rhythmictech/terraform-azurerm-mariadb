output "server_name" {
  description = "Name of MariaDB server"
  value       = azurerm_mariadb_server.mariadb_server.name
}

output "administrator_login" {
  description = "Administrative user name of MariaDB server"
  value       = var.administrator_login
}

output "administrator_password" {
  description = "Password for administrative user name of MariaDB server"
  value       = var.administrator_password
  sensitive   = true
}

output "server_id" {
  description = "ID of MariaDB server"
  value       = azurerm_mariadb_server.mariadb_server.id
}

output "db_name" {
  description = "Name of MariaDB database"
  value       = azurerm_mariadb_database.mariadb_database.name
}
