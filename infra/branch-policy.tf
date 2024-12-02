
resource "azuredevops_user_entitlement" "reviewers" {
  count                = length(var.auto_reviewer_ids)
  principal_name       = var.auto_reviewer_ids[count.index]
  account_license_type = "basic"
}

resource "azuredevops_branch_policy_auto_reviewers" "main" {
  project_id = azuredevops_project.main.id

  enabled  = true
  blocking = true

  settings {
    minimum_number_of_reviewers = var.minimum_number_of_reviewers
    auto_reviewer_ids           = azuredevops_user_entitlement.reviewers.*.id
    submitter_can_vote          = true
    message                     = "Required reviewer"

    scope {
      match_type = "DefaultBranch"
    }
  }
}