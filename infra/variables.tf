variable "application_name" {
  type = string
}

variable "environments" {
  type = list(string)
}

variable "azure_credentials" {
  type = map(
    object(
      {
        client_id       = string
        client_secret   = string
        tenant_id       = string
        subscription_id = string
      }
    )
  )
}

variable "azure_backends" {
  type = map(
    object({
      resource_group  = string
      storage_account = string
      container       = string
    })
  )
}

variable "repository_template_url" {
  type = string
}

variable "auto_reviewer_ids" {
  description = "The IDs of the auto reviewers."
  type        = list(string)
  default     = ["user1_id", "user2_id"]
}

variable "minimum_number_of_reviewers" {
  description = "The minimum number of reviewers required."
  type        = number
  default     = 2
}