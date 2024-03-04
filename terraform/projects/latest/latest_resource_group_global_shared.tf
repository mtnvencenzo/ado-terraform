resource "azurerm_resource_group" "latest_project_global_shared_resource_group" {
  name     = "rg-${var.sub}-${var.region}-${var.global_environment}-shared-${var.sequence}"
  location = var.location
  tags     = {
    Environment = "${var.global_environment}"
    Application = "shared"
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_role_assignment" "latest_project_global_shared_resource_group_owner_auth_role_assignment" {
  scope                 = azurerm_resource_group.latest_project_global_shared_resource_group.id
  role_definition_name  = "Owner"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [ 
    azurerm_resource_group.latest_project_global_shared_resource_group,
    azuread_service_principal.app_reg_latest_project_service_principal,
    azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp
  ]
}

resource "azurerm_role_assignment" "latest_project_global_shared_resource_group_blob_contrib_auth_role_assignment" {
  scope                 = azurerm_resource_group.latest_project_global_shared_resource_group.id
  role_definition_name  = "Storage Blob Data Contributor"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [ 
    azurerm_resource_group.latest_project_global_shared_resource_group,
    azuread_service_principal.app_reg_latest_project_service_principal,
    azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp
  ]
}


resource "azurerm_role_assignment" "latest_project_global_shared_resource_group_cnd_profile_contributor_role_assignment" {
  scope                 = azurerm_resource_group.latest_project_global_shared_resource_group.id
  role_definition_name  = "CDN Profile Contributor"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [ 
    azurerm_resource_group.latest_project_global_shared_resource_group,
    azuread_service_principal.app_reg_latest_project_service_principal,
    azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp
  ]
}

resource "azurerm_role_assignment" "latest_project_global_shared_resource_group_cnd_endpoint_contributor_role_assignment" {
  scope                 = azurerm_resource_group.latest_project_global_shared_resource_group.id
  role_definition_name  = "CDN Endpoint Contributor"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [ 
    azurerm_resource_group.latest_project_global_shared_resource_group,
    azuread_service_principal.app_reg_latest_project_service_principal,
    azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp
  ]
}
