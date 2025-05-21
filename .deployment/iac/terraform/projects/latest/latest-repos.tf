
# # ---------------------------
# # Setting up cezzi repository
# # ---------------------------
# resource "azuredevops_git_repository" "latest_project_repo_cezzi" {
#   project_id     = azuredevops_project.latest_project.id
#   name           = "Cezzi"
#   default_branch = "refs/heads/main"
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

# resource "azuredevops_build_folder" "latest_project_build_folder_cezzi" {
#   project_id  = azuredevops_project.latest_project.id
#   path        = "\\Cezzi"
#   description = "Pipelines releated to the cezzi repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }


# # ---------------------------
# # Setting up drinks repository
# # ---------------------------
# resource "azuredevops_git_repository" "latest_project_repo_drinks" {
#   project_id     = azuredevops_project.latest_project.id
#   name           = "Drinks"
#   default_branch = "refs/heads/main"
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

# resource "azuredevops_build_folder" "latest_project_build_folder_cocktails" {
#   project_id  = azuredevops_project.latest_project.id
#   path        = "\\Cocktails"
#   description = "Pipelines releated to the cocktails repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }


# # ---------------------------
# # Setting up drinks images repository
# # ---------------------------
# resource "azuredevops_git_repository" "latest_project_repo_drinks_images" {
#   project_id     = azuredevops_project.latest_project.id
#   name           = "Drinks-Images"
#   default_branch = "refs/heads/main"
#   initialization {
#     init_type = "Clean"
#   }
#   lifecycle {
#     prevent_destroy = false
#     ignore_changes = [
#       initialization,
#     ]
#   }
# }

# resource "azuredevops_build_folder" "latest_project_build_folder_cocktails_images" {
#   project_id  = azuredevops_project.latest_project.id
#   path        = "\\Cocktails-Images"
#   description = "Pipelines releated to the cocktails images repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }





# # ---------------------------
# # Setting up sharedinfrastructure repository
# # ---------------------------
# resource "azuredevops_git_repository" "latest_project_repo_sharedinfrastructure" {
#   project_id     = azuredevops_project.latest_project.id
#   name           = "SharedInfrastructure"
#   default_branch = "refs/heads/main"
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

# resource "azuredevops_build_folder" "latest_project_build_folder_sharedinfrastructure" {
#   project_id  = azuredevops_project.latest_project.id
#   path        = "\\SharedInfrastructure"
#   description = "Pipelines releated to the sharedinfrastructure repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }


# # ---------------------------
# # Setting up Kelso repository
# # ---------------------------
# resource "azuredevops_git_repository" "latest_project_repo_kelso" {
#   project_id     = azuredevops_project.latest_project.id
#   name           = "Kelso"
#   default_branch = "refs/heads/main"
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

# resource "azuredevops_build_folder" "latest_project_build_folder_kelso" {
#   project_id  = azuredevops_project.latest_project.id
#   path        = "\\Kelso"
#   description = "Pipelines releated to the kelso repository projects"
#   lifecycle {
#     prevent_destroy = true
#   }
# }



# ---------------------------
# Setting up Terraform Mods repository
# ---------------------------
resource "azuredevops_git_repository" "latest_project_repo_terraform_modules" {
  project_id     = azuredevops_project.latest_project.id
  name           = "Terraform-Modules"
  default_branch = "refs/heads/main"
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