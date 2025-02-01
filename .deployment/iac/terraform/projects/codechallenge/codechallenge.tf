resource "azuredevops_project" "codechallenge_project" {
  name               = "CodeChallenge"
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.workitem_template
  description        = "Project for storing code challenges from interviews or just general hello worlds"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_project_features" "codechallenge_project_features" {
  project_id = azuredevops_project.codechallenge_project.id
  features = {
    "boards" = "disabled"
    "repositories" = "enabled"
    "pipelines" = "enabled"
    "artifacts" = "disabled"
    "testplans" = "disabled"
  }
}