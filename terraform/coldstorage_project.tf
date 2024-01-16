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

resource "azuredevops_repository_policy_case_enforcement" "coldstorage_project_repo_policy_case_enforcement" {
  project_id              = azuredevops_project.coldstorage_project.id
  enabled                 = true
  blocking                = true
  enforce_consistent_case = true
}

resource "azuredevops_branch_policy_auto_reviewers" "coldstorage_branch_policy_auto_reviewers" {
  project_id = azuredevops_project.coldstorage_project.id
  enabled  = true
  blocking = true

  settings {
    auto_reviewer_ids  = [tolist(data.azuredevops_users.user_rvecchi.users)[0].id]
    submitter_can_vote = true
    minimum_number_of_reviewers = 1
    scope {
      match_type     = "DefaultBranch"
    }
  }
}

resource "azuredevops_branch_policy_comment_resolution" "coldstorage_branch_policy_comment_resolution" {
  project_id = azuredevops_project.coldstorage_project.id
  enabled  = true
  blocking = true
  settings {
    scope {
      match_type     = "DefaultBranch"
    }
  }
}

resource "azuredevops_branch_policy_merge_types" "coldstorage_branch_policy_merge_types" {
  project_id = azuredevops_project.coldstorage_project.id
  enabled  = true
  blocking = true

  settings {
    allow_squash                  = true
    allow_rebase_and_fast_forward = false
    allow_basic_no_fast_forward   = false
    allow_rebase_with_merge       = false
    scope {
      match_type     = "DefaultBranch"
    }
  }
}

resource "azuredevops_branch_policy_min_reviewers" "coldstorage_branch_policy_min_reviewers" {
  project_id = azuredevops_project.coldstorage_project.id
  enabled  = true
  blocking = true

  settings {
    reviewer_count                         = 1
    submitter_can_vote                     = true
    last_pusher_cannot_approve             = false
    allow_completion_with_rejects_or_waits = false
    on_push_reset_approved_votes           = true # OR on_push_reset_all_votes = true
    scope {
      match_type     = "DefaultBranch"
    }
  }
}

resource "azuredevops_branch_policy_work_item_linking" "coldstorage_branch_policy_workitem_linking" {
  project_id = azuredevops_project.coldstorage_project.id
  enabled  = false
  blocking = true

  settings {
    scope {
      match_type     = "DefaultBranch"
    }
  }
}
