resource "azuredevops_project" "default_project" {
  name               = "Default"
  visibility         = var.visibility
  version_control    = var.version_control
  work_item_template = var.workitem_template
  description        = "Default project for all vecchi owned solutions (managed by terraform)"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_project_features" "default_project_features" {
  project_id = azuredevops_project.default_project.id
  features = {
    "boards" = "enabled"
    "repositories" = "enabled"
    "pipelines" = "enabled"
    "artifacts" = "enabled"
    "testplans" = "disabled"
  }
}

resource "azuredevops_environment" "dev" {
  project_id = azuredevops_project.default_project.id
  name       = "dev"
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_project_pipeline_settings" "default_project_pipeline_settings" {
  project_id = azuredevops_project.default_project.id
  enforce_job_scope = false
  enforce_job_scope_for_release = false
  enforce_referenced_repo_scoped_token = false
  enforce_settable_var = true
  publish_pipeline_metadata = false
  status_badges_are_private = false
}

resource "azuredevops_repository_policy_case_enforcement" "default_project_repo_policy_case_enforcement" {
  project_id              = azuredevops_project.default_project.id
  enabled                 = true
  blocking                = true
  enforce_consistent_case = true
}

resource "azuredevops_serviceendpoint_azurerm" "default_project_service_endpoint_azurerm" {
  project_id                             = azuredevops_project.default_project.id
  service_endpoint_name                  = "sc-vec-eus-terraform-subscription-001"
  service_endpoint_authentication_scheme = "WorkloadIdentityFederation"
  azurerm_spn_tenantid                   = var.azurerm_spn_tenantid
  azurerm_subscription_id                = var.azurerm_subscription_id
  azurerm_subscription_name              = var.azurerm_subscription_name
  lifecycle {
    prevent_destroy = true
  }
}

resource "azuredevops_pipeline_authorization" "default_project_service_endpoint_azurerm_pipeline_authorization" {
  project_id  = azuredevops_project.default_project.id
  resource_id = azuredevops_serviceendpoint_azurerm.default_project_service_endpoint_azurerm.id
  type        = "endpoint"
}

data "azuread_service_principal" "default_project_service_endpoint_azurerm_serviceprincipal" {
  client_id = azuredevops_serviceendpoint_azurerm.default_project_service_endpoint_azurerm.service_principal_id
}


resource "azurerm_role_assignment" "default_project_service_endpoint_azurerm_authorization_role_assignment" {
  scope                 = data.azurerm_storage_container.global_content_storage_account_public_container.resource_manager_id
  role_definition_name  = "Storage Blob Data Contributor"
  principal_id          = azuread_service_principal.default_project_service_endpoint_azurerm_serviceprincipal.id
}


resource "azuredevops_branch_policy_auto_reviewers" "default_project_branch_policy_auto_reviewers" {
  project_id = azuredevops_project.default_project.id
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

resource "azuredevops_branch_policy_comment_resolution" "default_project_branch_policy_comment_resolution" {
  project_id = azuredevops_project.default_project.id
  enabled  = true
  blocking = true
  settings {
    scope {
      match_type     = "DefaultBranch"
    }
  }
}

resource "azuredevops_branch_policy_merge_types" "default_project_branch_policy_merge_types" {
  project_id = azuredevops_project.default_project.id
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

resource "azuredevops_branch_policy_min_reviewers" "default_project_branch_policy_min_reviewers" {
  project_id = azuredevops_project.default_project.id
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

resource "azuredevops_branch_policy_work_item_linking" "default_project_branch_policy_workitem_linking" {
  project_id = azuredevops_project.default_project.id
  enabled  = false
  blocking = true

  settings {
    scope {
      match_type     = "DefaultBranch"
    }
  }
}
