provider "azurerm" {
  subscription_id = "685dc6df-f715-40c9-91f3-ecf0aea044bd"
  features {}
}

variable "location" {
  description = "region where the resources will be deployed"
  default     = "East US"
}

variable "stage" {
  description = "The stage of the environment"
  default     = "prod"
}

variable "owner" {
  description = "Sets the 'owner' tag on all resources"
  type        = string
}

variable "additional_tags" {
  description = "A map of additional tags"
  type        = map(string)
  default     = {}
}

locals {
  storage_account_name = "${var.stage}-terraform-eon-demo-rg"
  tag_map = merge(
    { owner = var.owner,
    env = var.stage },
  var.additional_tags)
}

resource "azurerm_resource_group" "sample" {
  name     = local.storage_account_name
  location = var.location

  tags = local.tag_map
}

resource "azurerm_storage_account" "random" {
  name                     = "ranstoeauntclwaltke"
  resource_group_name      = azurerm_resource_group.sample.name
  location                 = azurerm_resource_group.sample.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = local.tag_map
}

resource "azurerm_storage_container" "blob" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.random.name
  container_access_type = "private"
}
