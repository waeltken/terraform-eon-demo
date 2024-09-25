terraform {
  backend "azurerm" {
    subscription_id      = "685dc6df-f715-40c9-91f3-ecf0aea044bd"
    resource_group_name  = "dev-terraform-eon-demo-rg"
    storage_account_name = "ranstoeauntclwaltke"
    container_name       = "tfstate"
    key                  = "terraform-eon-demo-dev.tfstate"
  }
}
