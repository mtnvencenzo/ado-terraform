resource "azuredevops_environment" "dev" {
  project_id = azuredevops_project.default_project.id
  name       = "dev"
  lifecycle {
    prevent_destroy = true
  }
}