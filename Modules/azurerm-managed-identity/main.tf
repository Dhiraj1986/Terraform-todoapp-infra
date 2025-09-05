

resource "azurerm_user_assigned_identity" "manage-identity" {
  location            = var.location
  name                = var.managed-identity-name
  resource_group_name = var.resource_group_name
  tags = var.tags
}