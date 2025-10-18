terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.46.0"
    }
  }

    backend "azurerm" {
   resource_group_name = "group2-rg-tfstate"
   storage_account_name = "group2storageanesed"
   container_name = "tfstate"
   key = "terraform.tfstate"
  }
}

provider "azurerm" {
  features {}
}