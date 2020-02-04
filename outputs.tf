output "server_name" {
  value = azurerm_mariadb_server.mariadb_server.name
}

output "administrator_login" {
  value = var.administrator_login
}

output "administrator_password" {
  value     = var.administrator_password
  sensitive = true
}

output "server_id" {
  value = azurerm_mariadb_server.mariadb_server.id
}

output "db_name" {
  value = azurerm_mariadb_database.mariadb_database.name
}
