terraform {
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = ">=1.4.0"
    }
  }
}

provider "azuredevops" {
  # Configuration options
}