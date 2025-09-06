



resource "azurerm_mssql_server" "sql-server" {
  name                         = var.sql-server-name
  resource_group_name          = var.resource_group_name
  location                     = var.location
  version                      = "12.0"
  administrator_login          = var.admin-username
  administrator_login_password = var.admin-password
  minimum_tls_version          = "1.2"

  tags = var.tags
}