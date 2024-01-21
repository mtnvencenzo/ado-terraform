resource "azuread_application" "app_reg_latest_project" {
  display_name = "appr-${var.sub}-devops-project-latest"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuread_application_password" "app_reg_latest_project_app_password" {
  application_id = azuread_application.app_reg_latest_project.id
  display_name          = "primary"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuread_service_principal" "app_reg_latest_project_service_principal" {
  client_id                     = azuread_application.app_reg_latest_project.client_id
  app_role_assignment_required  = false
  feature_tags {
    enterprise = true
    hide    = true
  }
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_serviceendpoint_azurerm" "app_reg_latest_project_sc_sp" {
  project_id                                = azuredevops_project.latest_project.id
  service_endpoint_name                     = "sc-${var.sub}-${var.region}-default_svc_principal-001"
  service_endpoint_authentication_scheme    = "ServicePrincipal"
  description                               = "Service principal based service connection for the latest project (managed by terraform)"

  azurerm_spn_tenantid                      = var.azurerm_spn_tenantid
  azurerm_subscription_id                   = var.azurerm_subscription_id
  azurerm_subscription_name                 = var.azurerm_subscription_name

  credentials {
    serviceprincipalid      = azuread_service_principal.app_reg_latest_project_service_principal.client_id
    serviceprincipalkey     = azuread_application_password.app_reg_latest_project_app_password.value
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_pipeline_authorization" "app_reg_latest_project_sc_sp_pipeline_authorization" {
  project_id  = azuredevops_project.latest_project.id
  resource_id = azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp.id
  type        = "endpoint"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_role_assignment" "latest_project_global_nuget_resource_group_owner_auth_role_assignment" {
  scope                 = azurerm_resource_group.latest_project_global_nuget_resource_group.id
  role_definition_name  = "Owner"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [ 
    azurerm_resource_group.latest_project_global_nuget_resource_group,
    azuread_service_principal.app_reg_latest_project_service_principal,
    azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp
  ]
}

# resource "azurerm_role_assignment" "app_reg_latest_project_sc_sp_authorization_role_assignment" {
#   scope                 = data.azurerm_storage_container.global_content_storage_account_public_container.resource_manager_id
#   role_definition_name  = "Storage Blob Data Contributor"
#   principal_id          = azuread_service_principal.app_reg_latest_project_content_service_principal.id
#   lifecycle {
#     prevent_destroy = true
#   }
#   depends_on = [ 
#     azurerm_resource_group.latest_project_global_nuget_resource_group
#   ]
# }