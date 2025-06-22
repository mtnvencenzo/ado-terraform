terraform init \
    -backend-config="storage_account_name=stveceusterraformstat001" \
    -backend-config="container_name=terraform-ado" \
    -backend-config="key=ado/terraform.tfstate" \
    -backend-config="resource_group_name=rg-vec-eus-administration-001"


# removing 
terraform state list
# terraform state rm module.latest_project.azuredevops_pipeline_authorization.app_reg_latest_project_acr_pipeline_authorization
# terraform state rm module.latest_project.azuredevops_serviceendpoint_azurecr.app_reg_latest_project_acr
