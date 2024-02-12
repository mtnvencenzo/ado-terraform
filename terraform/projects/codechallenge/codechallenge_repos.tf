
# ---------------------------
# Setting up foraint repository
# ---------------------------
resource "azuredevops_git_repository" "codechallenge_project_repo_forafinancial" {
  project_id        = azuredevops_project.codechallenge_project.id
  name              = "Interview-ForaFinancial"
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