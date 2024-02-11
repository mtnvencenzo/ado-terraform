
# ---------------------------
# Setting up foraint repository
# ---------------------------
resource "azuredevops_git_repository" "foraint_project_repo_bhframework" {
  project_id        = azuredevops_project.foraint_project.id
  name              = "Fora-Int"
  default_branch    = "refs/heads/main"
  initialization {
    init_type = "Clean"
  }
  lifecycle {
    prevent_destroy = true
    ignore_changes = [
      initialization,
    ]
  }
}