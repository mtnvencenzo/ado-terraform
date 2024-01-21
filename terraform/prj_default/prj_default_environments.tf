# resource "azuredevops_environment" "dev" {
#   project_id = azuredevops_project.default_project.id
#   name       = "dev"
#   lifecycle {
#     prevent_destroy = true
#   }
# }

# resource "azuredevops_environment" "global" {
#   project_id = azuredevops_project.default_project.id
#   name       = "global"
#   lifecycle {
#     prevent_destroy = true
#   }
# }