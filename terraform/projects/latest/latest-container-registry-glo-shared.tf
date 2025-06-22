resource "azurerm_container_registry" "acr_latest_project" {
  name                  = "acr${var.sub}${var.region}${var.global_environment}shared${var.sequence}"
  resource_group_name   = azurerm_resource_group.latest_project_global_shared_resource_group.name
  location              = azurerm_resource_group.latest_project_global_shared_resource_group.location
  sku                   = "Basic"
  admin_enabled         = true
  data_endpoint_enabled = false
  identity {
    type = "SystemAssigned"
  }
  tags = {
    Environment = "${var.global_environment}"
    Application = "shared"
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      tags
    ]
  }
}

# resource "azuredevops_serviceendpoint_azurecr" "app_reg_latest_project_acr" {
#   project_id                = azuredevops_project.latest_project.id
#   service_endpoint_name     = "appr-${var.sub}-devops-project-latest-acr"
#   resource_group            = azurerm_resource_group.latest_project_global_shared_resource_group.name
#   azurecr_spn_tenantid      = var.azurerm_spn_tenantid
#   azurecr_name              = azurerm_container_registry.acr_latest_project.name
#   azurecr_subscription_id   = var.azurerm_subscription_id
#   azurecr_subscription_name = var.azurerm_subscription_name
# }

# resource "azuredevops_pipeline_authorization" "app_reg_latest_project_acr_pipeline_authorization" {
#   project_id  = azuredevops_project.latest_project.id
#   resource_id = azuredevops_serviceendpoint_azurecr.app_reg_latest_project_acr.id
#   type        = "endpoint"
#   lifecycle {
#     prevent_destroy = true
#   }
# }