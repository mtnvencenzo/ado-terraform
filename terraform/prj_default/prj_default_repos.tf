
# # ---------------------------
# # Setting up cezzi repository
# # ---------------------------
# resource "azuredevops_git_repository" "default_project_repo_cezzi" {
#   project_id        = azuredevops_project.default_project.id
#   name              = "Cezzi"
#   default_branch    = "refs/heads/main"
#   initialization {
#     init_type = "Clean"
#   }
#   lifecycle {
#     prevent_destroy = true
#     ignore_changes = [
#       initialization,
#     ]
#   }
# }

# resource "azuredevops_build_folder" "default_project_build_folder_cezzi" {
#   project_id  = azuredevops_project.default_project.id
#   path        = "\\Cezzi"
#   description = "Pipelines releated to the cezzi repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }


# # ---------------------------
# # Setting up deepsleep repository
# # ---------------------------
# resource "azuredevops_git_repository" "default_project_repo_deepsleep" {
#   project_id        = azuredevops_project.default_project.id
#   name              = "DeepSleep"
#   default_branch    = "refs/heads/main"
#   initialization {
#     init_type = "Clean"
#   }
#   lifecycle {
#     prevent_destroy = true
#     ignore_changes = [
#       initialization,
#     ]
#   }
# }

# resource "azuredevops_build_folder" "default_project_build_folder_deepsleep" {
#   project_id  = azuredevops_project.default_project.id
#   path        = "\\DeepSleep"
#   description = "Pipelines releated to the deepsleep repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }


# # ---------------------------
# # Setting up drinks repository
# # ---------------------------
# resource "azuredevops_git_repository" "default_project_repo_drinks" {
#   project_id        = azuredevops_project.default_project.id
#   name              = "Drinks"
#   default_branch    = "refs/heads/main"
#   initialization {
#     init_type = "Clean"
#   }
#   lifecycle {
#     prevent_destroy = true
#     ignore_changes = [
#       initialization,
#     ]
#   }
# }

# resource "azuredevops_build_folder" "default_project_build_folder_drinks" {
#   project_id  = azuredevops_project.default_project.id
#   path        = "\\Drinks"
#   description = "Pipelines releated to the drinks repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }


# # ---------------------------
# # Setting up sharedinfrastructure repository
# # ---------------------------
# resource "azuredevops_git_repository" "default_project_repo_sharedinfrastructure" {
#   project_id        = azuredevops_project.default_project.id
#   name              = "SharedInfrastructure"
#   default_branch    = "refs/heads/main"
#   initialization {
#     init_type = "Clean"
#   }
#   lifecycle {
#     prevent_destroy = true
#     ignore_changes = [
#       initialization,
#     ]
#   }
# }

# resource "azuredevops_build_folder" "default_project_build_folder_sharedinfrastructure" {
#   project_id  = azuredevops_project.default_project.id
#   path        = "\\SharedInfrastructure"
#   description = "Pipelines releated to the sharedinfrastructure repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }