resource "azuredevops_project" "main" {
  name        = "Agile-Project-Tf"
  description = "Simple project deploy with terraform to quickly and easily create new Azure DevOps projects."

  visibility         = "private"
  version_control    = "Git"
  work_item_template = "Agile"
}

resource "azuredevops_git_repository" "infra" {
  project_id = azuredevops_project.main.id
  name       = "infrastructure"
  initialization {
    init_type   = "Import"
    source_type = "Git"
    source_url  = "https://github.com/fkheinstein204/azdo-tf-tpl-multi-stage.git"
  }
}
