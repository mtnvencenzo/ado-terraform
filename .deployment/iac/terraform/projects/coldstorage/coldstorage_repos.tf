
# ---------------------------
# Setting up cezzi repository
# ---------------------------
resource "azuredevops_git_repository" "coldstorage_project_repo_bhframework" {
  project_id        = azuredevops_project.coldstorage_project.id
  name              = "BH-Framework"
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

resource "azuredevops_git_repository" "coldstorage_project_repo_bhintegrations" {
  project_id        = azuredevops_project.coldstorage_project.id
  name              = "BH-Integrations"
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

resource "azuredevops_git_repository" "coldstorage_project_repo_bhjobprocessing" {
  project_id        = azuredevops_project.coldstorage_project.id
  name              = "BH-JobProcessing"
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

resource "azuredevops_git_repository" "coldstorage_project_repo_bhsmg" {
  project_id        = azuredevops_project.coldstorage_project.id
  name              = "BH-Smg"
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

resource "azuredevops_git_repository" "coldstorage_project_repo_vechikingsite" {
  project_id        = azuredevops_project.coldstorage_project.id
  name              = "Vec-HikingSite"
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

resource "azuredevops_git_repository" "coldstorage_project_repo_vectravrlsite" {
  project_id        = azuredevops_project.coldstorage_project.id
  name              = "Vec-TravelSite"
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