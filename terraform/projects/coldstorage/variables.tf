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

variable "code_reviewer_user" {
  type = object({
    id = string
  })
}