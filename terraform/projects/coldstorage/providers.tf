# terraform {
#   required_providers {
#     azurerm = {
#       source = "hashicorp/azurerm"
#       version = ">=3.86.0"
#     }

#     azuredevops = {
#       source = "microsoft/azuredevops"
#       version = ">=0.11.0"
#     }
#   }
# }

# data "azurerm_storage_account" "terraform_storage_account" {
#   name                = "st${var.sub}${var.region}terraformstat001"
#   resource_group_name = "rg-${var.sub}-${var.region}-administration-${var.sequence}"
# }