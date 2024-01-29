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
  service_endpoint_name                     = "sc-${var.sub}-${var.region}-default-svc-principal-001"
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


resource "azurerm_role_assignment" "app_reg_latest_project_sc_terraform_storage_account_auth_role_assignment" {
  scope                 = data.azurerm_storage_account.terraform_storage_account.id
  role_definition_name  = "Contributor"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_role_assignment" "app_reg_latest_project_sc_acr_acrpush_role_assignment" {
  scope                 = azurerm_container_registry.acr_latest_project.id
  role_definition_name  = "AcrPush"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_role_assignment" "app_reg_latest_project_sc_acr_acrimagesigner_role_assignment" {
  scope                 = azurerm_container_registry.acr_latest_project.id
  role_definition_name  = "AcrImageSigner"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
}