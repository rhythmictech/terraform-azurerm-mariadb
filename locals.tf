locals {
  administrator_login      = substr(local.administrator_login_long, 0, 16)
  administrator_login_long = var.administrator_login == "" ? random_pet.name.id : var.administrator_login
  administrator_password   = var.administrator_password == "" ? random_password.db_password[0].result : var.administrator_password
  name                     = var.name == "" ? random_pet.name.id : var.name
  tags                     = module.tags.tags_no_name
}
