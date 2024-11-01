terraform {
  required_version = ">=1.8.0"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      # version = "4.7.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
    virtual_machine {
      delete_os_disk_on_deletion = true
    }
  }
}
