variable "PAT" {
	type = string
	default = ""
}

variable "workitem_template" {
	type = string
	default = "Scrum"
}

variable "version_control" {
	type = string
	default = "Git"
}

variable "visibility" {
	type = string
	default = "private"
}

variable "devops_url" {
	type = string
	default = "https://dev.azure.com/vecchi"
}

variable "azurerm_spn_tenantid" {
	type = string
	default = "abc490e5-395b-4db1-9d9f-18434a45263d"
}

variable "azurerm_subscription_id" {
	type = string
	default = "1d9ecc00-242a-460d-8b08-b71db19f094e"
}

variable "azurerm_subscription_name" {
	type = string
	default = "sub-vecchi-001"
}

variable "azurerm_resource_group_glo_content" {
	type = string
	default = "rg-vec-eus-glo-content-001"
}

variable "azurerm_storage_account_glo_content" {
	type = string
	default = "stvecglocontent001"
}