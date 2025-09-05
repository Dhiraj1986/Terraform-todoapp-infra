
resource "azurerm_mssql_database" "mssql-db" {
  name         = var.mssql-db-name
  server_id    = var.server_id
  collation    = var. collation
  license_type = var.license_type
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = var.tags

  
}