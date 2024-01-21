resource "azuredevops_project" "coldstorage_project" {
  name               = "ColdStorage"
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.workitem_template
  description        = "Project for storing old, out of date, or crappy unused code (managed by terraform)"


  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_project_features" "coldstorage_features" {
  project_id = azuredevops_project.coldstorage_project.id
  features = {
    "boards" = "disabled"
    "repositories" = "enabled"
    "pipelines" = "disabled"
    "artifacts" = "disabled"
    "testplans" = "disabled"
  }
}