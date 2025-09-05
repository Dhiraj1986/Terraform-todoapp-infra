
resource "azurerm_storage_account" "storage-acc" {
  name                     = var.sa-name
  resource_group_name      = var.rg-name
  location                 = var.sa-location
  account_tier             = "Standard"
  account_replication_type = "GRS"

  tags = var.sa-tags
   

}