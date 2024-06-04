# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
  backend "azurerm" {
    resource_group_name = "dev-resource"
    storage_account_name= "terraformdbs"
    container_name = "dev-storage-container"
    key = "terraform.tfstate"
    access_key = "cy/sazkQKcunlATK4xN9n7YYfMc/Uh7gnJpj65nU/woq9OxtWEXYjmSOZD3G+2KZ6tjJesfyqF7S+AStFNww4w=="

  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
  client_id       = var.add_ID
  client_secret   = var.password
  tenant_id       = var.tenant
  subscription_id = var.subscription


}