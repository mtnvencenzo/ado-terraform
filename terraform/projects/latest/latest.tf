resource "azuredevops_project" "latest_project" {
  name               = "Latest"
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.workitem_template
  description        = "Default project for all vecchi owned solutions (managed by terraform)"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_project_features" "latest_project_features" {
  project_id = azuredevops_project.latest_project.id
  features = {
    "boards" = "enabled"
    "repositories" = "enabled"
    "pipelines" = "enabled"
    "artifacts" = "enabled"
    "testplans" = "disabled"
  }
}
