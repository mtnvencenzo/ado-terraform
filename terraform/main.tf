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

