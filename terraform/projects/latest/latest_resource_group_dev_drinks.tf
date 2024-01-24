resource "azurerm_resource_group" "latest_project_dev_drinks_resource_group" {
  name     = "rg-${var.sub}-${var.region}-dev-drinks-${var.sequence}"
  location = var.location
  tags     = {
    Environment = "${var.environment}"
    Application = "drinks"
  }
  lifecycle {
    prevent_destroy = true
  }
}


resource "azurerm_role_assignment" "latest_project_dev_drinks_resource_group_owner_auth_role_assignment" {
  scope                 = azurerm_resource_group.latest_project_dev_drinks_resource_group.id
  role_definition_name  = "Owner"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [ 
    azurerm_resource_group.latest_project_dev_drinks_resource_group,
    azuread_service_principal.app_reg_latest_project_service_principal,
    azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp
  ]
}


resource "azurerm_role_assignment" "latest_project_dev_drinks_resource_group_blob_contrib_auth_role_assignment" {
  scope                 = azurerm_resource_group.latest_project_dev_drinks_resource_group.id
  role_definition_name  = "Storage Blob Data Contributor"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = true
  }
  depends_on = [ 
    azurerm_resource_group.latest_project_dev_drinks_resource_group,
    azuread_service_principal.app_reg_latest_project_service_principal,
    azuredevops_serviceendpoint_azurerm.app_reg_latest_project_sc_sp
  ]
}


resource "azurerm_aadb2c_directory" "dev_drinks_b2c_directory" {
  resource_group_name     = azurerm_resource_group.latest_project_dev_drinks_resource_group.name
  country_code            = "US"
  data_residency_location = "United States"
  domain_name             = "dev${var.sub}drinks.onmicrosoft.com"
  sku_name                = "PremiumP1"
  lifecycle {
    prevent_destroy = true
  }
}
