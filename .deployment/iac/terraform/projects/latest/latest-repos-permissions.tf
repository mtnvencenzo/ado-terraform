data "azuredevops_users" "build_service" {
  principal_name = azuredevops_project.latest_project.id
}

# --------------------------------------------------------------------------------------------------
# Adding permissions here because without this the build was unable to commit a git tag to the repo.
# [GenericRead] and [CreateTag] were there by default, adding [GenericContribute]
# --------------------------------------------------------------------------------------------------
resource "azuredevops_git_permissions" "build_service_permission" {
  project_id    = azuredevops_project.latest_project.id
  principal     = one(data.azuredevops_users.build_service.users).descriptor
  permissions = {
    GenericContribute     = "Allow"
    GenericRead           = "Allow"
    CreateTag             = "Allow"
  }
}