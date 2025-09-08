
resource "azurerm_public_ip" "pip" {
  name                = var.pip-name
  resource_group_name = var.resource_group_name
  location            = var.location
  allocation_method   = "Static"
  sku = var.sku

  tags = var.tags
}