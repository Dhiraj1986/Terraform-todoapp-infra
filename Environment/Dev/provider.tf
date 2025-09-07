terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.42.0"
    }
  }
  backend "azurerm" {
    
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
