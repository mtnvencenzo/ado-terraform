# resource "azuredevops_project_pipeline_settings" "latest_project_pipeline_settings" {
#   project_id                           = azuredevops_project.latest_project.id
#   enforce_job_scope                    = true
#   enforce_job_scope_for_release        = true
#   enforce_referenced_repo_scoped_token = false
#   enforce_settable_var                 = true
#   publish_pipeline_metadata            = false
#   status_badges_are_private            = true
# }

