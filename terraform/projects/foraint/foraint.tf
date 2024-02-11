resource "azuredevops_project" "foraint_project" {
  name               = "ForaInt"
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.workitem_template
  description        = "Project for storing old, out of date, or crappy unused code (managed by terraform)"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_project_features" "foraint_project_features" {
  project_id = azuredevops_project.foraint_project.id
  features = {
    "boards" = "disabled"
    "repositories" = "enabled"
    "pipelines" = "enabled"
    "artifacts" = "disabled"
    "testplans" = "disabled"
  }
}