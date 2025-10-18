terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.26.0"
    }
  }
}

provider "azurerm" {
  features {}
  subscription_id = "0c3baf09-c930-4225-bc39-12caa97c9fa6"
}

variable "location" {
  default = "West Europe"
}

variable "prefix" {
  default = "khalid"
}

resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-rg-tfstate"
  location = var.location
}

resource "azurerm_storage_account" "sa" {
  name                     = "${var.prefix}storage${random_string.suffix.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  min_tls_version          = "TLS1_2"
}

resource "azurerm_storage_container" "container" {
  name                  = "tfstate"
  storage_account_name  = azurerm_storage_account.sa.name
  container_access_type = "private"
}

resource "random_string" "suffix" {
  length  = 6
  upper   = false
  special = false
}

output "backend_config" {
  value = {
    resource_group_name  = azurerm_resource_group.rg.name
    storage_account_name = azurerm_storage_account.sa.name
    container_name       = azurerm_storage_container.container.name
    key                  = "terraform.tfstate"
  }
}
