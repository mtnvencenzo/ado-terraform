terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
      version = "3.86.0"
    }

    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=0.11.0"
    }
  }

  backend "azurerm" { }
}

provider "azurerm" {
  features {}
}

provider "azuredevops" {
    org_service_url = var.devops_url
    personal_access_token = var.PAT
}

data "azuredevops_users" "user_rvecchi" {
  principal_name = "rvecchi@gmail.com"
}

# data "azurerm_storage_container" "global_content_storage_account_public_container" {
#   name                 = "public"
#   storage_account_name = var.azurerm_storage_account_glo_content
# }

# TODO: Setup storage accounts
# data "azurerm_storage_container" "global_content_storage_account_public_container" {
#   name                 = "public"
#   storage_account_name = var.azurerm_storage_account_glo_content
# }