resource "azuredevops_environment" "latest_project_dev" {
  project_id = azuredevops_project.latest_project.id
  name       = "dev"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_environment" "latest_project_global" {
  project_id = azuredevops_project.latest_project.id
  name       = "global"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_environment" "latest_project_nuget" {
  project_id = azuredevops_project.latest_project.id
  name       = "nuget"
  lifecycle {
    prevent_destroy = true
  }
}