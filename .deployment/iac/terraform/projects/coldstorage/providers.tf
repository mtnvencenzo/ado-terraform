terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }

    azuredevops = {
      source = "microsoft/azuredevops"
    }
  }
}

data "azurerm_storage_account" "terraform_storage_account" {
  name                = "st${var.sub}${var.region}terraformstat001"
  resource_group_name = "rg-${var.sub}-${var.region}-administration-${var.sequence}"
}