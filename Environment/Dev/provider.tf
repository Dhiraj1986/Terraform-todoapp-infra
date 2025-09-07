terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
  backend "azurerm" {
    use_oidc = true
    client-id: da20dc07-bace-4293-ab7b-ff449a8911aa
    tenant-id: defb5fbe-74e0-453c-9d33-594936bf34c5
    subscription-id: 81cc1915-8d88-419e-8fa3-0178811761bd
    resource_group_name  = "dhiraj-rg"
    storage_account_name = "dhirajstorage11"
    container_name       = "dhiraj-blob-container"
    key                  = "dev.tfstate"
  }
}


provider "azurerm" {
  features {}
  subscription_id = "81cc1915-8d88-419e-8fa3-0178811761bd"
}
