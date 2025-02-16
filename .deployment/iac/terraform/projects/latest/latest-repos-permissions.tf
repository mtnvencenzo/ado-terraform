data "azuredevops_users" "build_service" {
  principal_name = azuredevops_project.latest_project.id
}

resource "azuredevops_git_permissions" "build_service_permission" {
  project_id    = azuredevops_project.latest_project.id
  principal     = one(data.azuredevops_users.build_service.users).descriptor
  permissions = {
    GenericContribute     = "Allow"
    Read                  = "Allow"
    CreateTag             = "Allow"
  }
}