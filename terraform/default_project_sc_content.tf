resource "azuredevops_serviceendpoint_azurerm" "default_project_service_endpoint_content_azurerm" {
  project_id                             = azuredevops_project.default_project.id
  service_endpoint_name                  = "sc-vec-eus-content-global-001"
  service_endpoint_authentication_scheme = "ServicePrincipal"
  azurerm_spn_tenantid                   = var.azurerm_spn_tenantid
  azurerm_subscription_id                = var.azurerm_subscription_id
  azurerm_subscription_name              = var.azurerm_subscription_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_pipeline_authorization" "default_project_service_endpoint_content_azurerm_pipeline_authorization" {
  project_id  = azuredevops_project.default_project.id
  resource_id = azuredevops_serviceendpoint_azurerm.default_project_service_endpoint_content_azurerm.id
  type        = "endpoint"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuread_service_principal" "default_project_service_endpoint_content_azurerm_serviceprincipal" {
  client_id = azuredevops_serviceendpoint_azurerm.default_project_service_endpoint_content_azurerm.service_principal_id
  use_existing   = true
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_role_assignment" "default_project_service_endpoint_content_azurerm_authorization_role_assignment" {
  scope                 = data.azurerm_storage_container.global_content_storage_account_public_container.resource_manager_id
  role_definition_name  = "Storage Blob Data Contributor"
  principal_id          = azuread_service_principal.default_project_service_endpoint_content_azurerm_serviceprincipal.id
  lifecycle {
    prevent_destroy = true
  }
}