# resource "azuread_application" "app_reg_default_project_content" {
#   display_name = "appreg-ado-default-content-001"
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "azuread_application_password" "app_reg_default_project_content_password" {
#   application_id = azuread_application.app_reg_default_project_content.id
#   display_name          = "primary"
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "azuread_service_principal" "app_reg_default_project_content_service_principal" {
#   client_id                     = azuread_application.app_reg_default_project_content.client_id
#   app_role_assignment_required  = false
#   feature_tags {
#     enterprise = true
#     hide    = true
#   }
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "azuredevops_serviceendpoint_azurerm" "app_reg_default_project_content_sc" {
#   project_id                                = azuredevops_project.default_project.id
#   service_endpoint_name                     = "sc-vec-eus-content-global-001"
#   service_endpoint_authentication_scheme    = "ServicePrincipal"
#   description                               = "Storage account content service connection for enabling pipeline uploads of storage blobs (managed by terraform)"

#   azurerm_spn_tenantid                   = var.azurerm_spn_tenantid
#   azurerm_subscription_id                = var.azurerm_subscription_id
#   azurerm_subscription_name              = var.azurerm_subscription_name

#   credentials {
#     serviceprincipalid      = azuread_service_principal.app_reg_default_project_content_service_principal.id
#     serviceprincipalkey     = azuread_application_password.app_reg_default_project_content_password.value
#   }

#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "azuredevops_pipeline_authorization" "app_reg_default_project_content_sc_pipeline_authorization" {
#   project_id  = azuredevops_project.default_project.id
#   resource_id = azuredevops_serviceendpoint_azurerm.app_reg_default_project_content_sc.id
#   type        = "endpoint"
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "azurerm_role_assignment" "app_reg_default_project_content_service_principal_authorization_role_assignment" {
#   scope                 = data.azurerm_storage_container.global_content_storage_account_public_container.resource_manager_id
#   role_definition_name  = "Storage Blob Data Contributor"
#   principal_id          = azuread_service_principal.app_reg_default_project_content_service_principal.id
#   lifecycle {
#     prevent_destroy = true
#   }
# }