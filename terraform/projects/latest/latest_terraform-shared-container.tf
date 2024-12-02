resource "azurerm_storage_container" "terraform_shared_container" {
  name                  = "terraform-shared"
  storage_account_name  = data.azurerm_storage_account.terraform_storage_account.name
  container_access_type = "private"
  depends_on = [
    data.azurerm_storage_account.terraform_storage_account
  ]
  lifecycle {
    prevent_destroy = true
  }
}


resource "azurerm_role_assignment" "terraform_shared_container_auth_role_assignment" {
  scope                 = azurerm_storage_container.terraform_shared_container.resource_manager_id
  role_definition_name  = "Owner"
  principal_id          = azuread_service_principal.app_reg_latest_project_service_principal.id
  lifecycle {
    prevent_destroy = false
  }
}