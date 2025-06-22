terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=4.16.0"
    }

    azuredevops = {
      source  = "microsoft/azuredevops"
      version = "=1.6.0"
    }
  }

  backend "azurerm" {}
}

provider "azurerm" {
  features {}
}

# provider "azuredevops" {
#   org_service_url       = var.devops_url
#   personal_access_token = var.PAT
# }

# data "azuredevops_users" "user_rvecchi" {
#   principal_name = "rvecchi@gmail.com"
# }

module "latest_project" {
  source            = "./projects/latest"
  workitem_template = var.workitem_template
  version_control   = var.version_control
  visibility        = var.visibility
  //devops_url                = var.devops_url
  azurerm_spn_tenantid      = var.azurerm_spn_tenantid
  azurerm_subscription_id   = var.azurerm_subscription_id
  azurerm_subscription_name = var.azurerm_subscription_name
  global_environment        = var.global_environment
  location                  = var.location
  sub                       = var.sub
  sequence                  = var.sequence
  //code_reviewer_user        = tolist(data.azuredevops_users.user_rvecchi.users)[0]

  providers = {
    azurerm     = azurerm,
    azuredevops = azuredevops
  }
}

# module "coldstorage_project" {
#   source             = "./projects/coldstorage"
#   workitem_template  = var.workitem_template
#   version_control    = var.version_control
#   visibility         = var.visibility
#   devops_url         = var.devops_url
#   sub                = var.sub
#   sequence           = var.sequence
#   code_reviewer_user = tolist(data.azuredevops_users.user_rvecchi.users)[0]

#   providers = {
#     azurerm     = azurerm,
#     azuredevops = azuredevops
#   }
# }

# module "codechallenge_project" {
#   source             = "./projects/codechallenge"
#   workitem_template  = var.workitem_template
#   version_control    = var.version_control
#   visibility         = var.visibility
#   devops_url         = var.devops_url
#   sub                = var.sub
#   sequence           = var.sequence
#   code_reviewer_user = tolist(data.azuredevops_users.user_rvecchi.users)[0]

#   providers = {
#     azurerm     = azurerm,
#     azuredevops = azuredevops
#   }
# }