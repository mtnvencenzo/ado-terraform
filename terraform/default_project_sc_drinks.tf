resource "azuredevops_serviceendpoint_azurerm" "default_project_service_endpoint_drinks_azurerm" {
  project_id                             = azuredevops_project.default_project.id
  service_endpoint_name                  = "sc-vec-eus-terraform-drinks-001"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  azurerm_spn_tenantid                   = var.azurerm_spn_tenantid
  azurerm_subscription_id                = var.azurerm_subscription_id
  azurerm_subscription_name              = var.azurerm_subscription_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_pipeline_authorization" "default_project_service_endpoint_drinks_azurerm_pipeline_authorization" {
  project_id  = azuredevops_project.default_project.id
  resource_id = azuredevops_serviceendpoint_azurerm.default_project_service_endpoint_drinks_azurerm.id
  type        = "endpoint"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuread_service_principal" "default_project_service_endpoint_drinks_azurerm_serviceprincipal" {
  client_id = azuredevops_serviceendpoint_azurerm.default_project_service_endpoint_drinks_azurerm.service_principal_id
  use_existing   = true
  lifecycle {
    prevent_destroy = true
  }
}