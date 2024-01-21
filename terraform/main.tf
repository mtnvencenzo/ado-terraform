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

module "prj_latest" {
    source        	                = "./prj_latest"
    workitem_template               = var.workitem_template
    version_control                 = var.version_control
    visibility                      = var.visibility
    devops_url                      = var.devops_url
    azurerm_spn_tenantid            = var.azurerm_spn_tenantid
    azurerm_subscription_id         = var.azurerm_subscription_id
    azurerm_subscription_name       = var.azurerm_subscription_name
    environment                     = var.environment
    global_environment              = var.global_environment
    location                        = var.location
    sub                             = var.sub
    sequence                        = var.sequence
    code_reviewer_user    = tolist(data.azuredevops_users.user_rvecchi.users)[0]

    providers = {
        azurerm = azurerm,
        azuredevops = azuredevops
    }
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