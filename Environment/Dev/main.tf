module "rg" {
  source      = "../../modules/azurerm-resource-group"
  rg-name     = "rg-dev-todoapp"
  rg-location = "centralindia"
  rg-tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}

module "storage" {
  depends_on  = [module.rg]
  source      = "../../modules/azurerm-storage-account"
  sa-name     = "storagedevtodoapp1"
  rg-name     = "rg-dev-todoapp"
  sa-location = "centralindia"
  sa-tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}

module "acr" {
  depends_on          = [module.rg]
  source              = "../../modules/azurerm-container-registry"
  acr-name            = "acrdevtodoapp1"
  resource_group_name = "rg-dev-todoapp"
  location            = "centralindia"
  tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}

module "sql" {
  depends_on          = [module.rg]
  source              = "../../modules/azurerm-sql-server"
  sql-server-name     = "sql-dev-todoapp"
  resource_group_name = "rg-dev-todoapp"
  location            = "centralindia"
  admin-username      = "dhirajadmin"
  admin-password      = "dhiraj@123"
  tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}

module "sql-db" {
  depends_on    = [module.sql]
  source        = "../../modules/azurerm-sql-database"
  mssql-db-name = "mssql-db-dev-todoapp"
  server_id     = module.sql.server_id
  collation     = "SQL_Latin1_General_CP1_CI_AS"
  license_type  = "LicenseIncluded"

  tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}

module "aks" {
  depends_on          = [module.rg]
  source              = "../../modules/azurerm-kubernetes-cluster"
  aks-name            = "aks-dev-todoapp"
  resource_group_name = "rg-dev-todoapp"
  location            = "centralindia"
  dns_prefix          = "dhiraj-dns"
  node_count          = "1"
  vm_size             = "Standard_D2_v2"
  tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}

module "managed-identity" {
  depends_on            = [module.rg]
  source                = "../../modules/azurerm-managed-identity"
  resource_group_name   = "rg-dev-todoapp"
  location              = "centralindia"
  managed-identity-name = "managed-id-dev-todoapp"

  tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}

module "key-vault" {
  depends_on          = [module.rg]
  source              = "../../modules/azurerm-keyvault"
  kv-name             = "keyvault-dev-todoapp"
  resource_group_name = "rg-dev-todoapp"
  location            = "centralindia"


  tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}


module "dev-pip" {
  depends_on          = [module.rg]
  source              = "../../Modules/azurerm-public-ip"
  pip-name           = "pip-dev-todoapp"
  resource_group_name = "rg-dev-todoapp"
  location            = "centralindia"
  sku = "Basic"
  tags = {
    "managed by"  = "terraform"
    "owner"       = "todoapp team"
    "environment" = "dev"
  }
}
