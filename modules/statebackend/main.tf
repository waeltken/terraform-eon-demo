resource "random_string" "suffix" {
  length  = 4
  special = false
  lower   = true
  upper   = false
  numeric = true
}

locals {
  storage_account_name = "${var.name}${random_string.suffix.result}stg"
  resource_group_name  = "${var.name}-${random_string.suffix.result}-rg"
}

resource "azurerm_resource_group" "backend" {
  name     = local.resource_group_name
  location = var.location
}

resource "azurerm_storage_account" "backend" {
  name                     = local.storage_account_name
  resource_group_name      = azurerm_resource_group.backend.name
  location                 = azurerm_resource_group.backend.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "container" {
  name                  = var.state_container_name
  storage_account_name  = azurerm_storage_account.backend.name
  container_access_type = "private"
}
