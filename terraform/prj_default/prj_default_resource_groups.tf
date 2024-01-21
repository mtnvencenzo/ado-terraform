resource "azurerm_resource_group" "latest_project_global_nuget_resource_group" {
  name     = "rg-${var.sub}-${var.region}-${var.global_environment}-nuget-${var.sequence}"
  location = var.location
  tags     = {
    Environment = var.global_environment
    Application = "nuget"
  }
  lifecycle {
    prevent_destroy = true
  }
}