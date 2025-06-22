variable "PAT" {
  type    = string
  default = ""
}

variable "workitem_template" {
  type    = string
  default = "Scrum"
}

variable "version_control" {
  type    = string
  default = "Git"
}

variable "visibility" {
  type    = string
  default = "private"
}

# variable "devops_url" {
#   type    = string
#   default = "https://dev.azure.com/vecchi"
# }

variable "azurerm_spn_tenantid" {
  type    = string
  default = "abc490e5-395b-4db1-9d9f-18434a45263d"
}

variable "azurerm_subscription_id" {
  type    = string
  default = "1d9ecc00-242a-460d-8b08-b71db19f094e"
}

variable "azurerm_subscription_name" {
  type    = string
  default = "sub-vecchi-001"
}

variable "global_environment" {
  type        = string
  description = "Global environment name, e.g. 'dev' or 'stage' or 'prod'"
  default     = "glo"
}

variable "location" {
  type        = string
  description = "Azure region where to create resources."
  default     = "East US"
}

variable "region" {
  type    = string
  default = "eus"
}

variable "sub" {
  type        = string
  description = "Subscription short identitifer to be used in resource naming"
  default     = "vec"
}

variable "sequence" {
  type        = string
  description = "The sequence number of the resource typically starting with 001"
  default     = "001"
}

# variable "code_reviewer_user" {
#   type = object({
#     id = string
#   })
# }