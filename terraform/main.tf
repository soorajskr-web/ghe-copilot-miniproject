terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0"
    }
  }
  required_version = ">= 1.3.0"

  backend "azurerm" {
    resource_group_name  = "terraform-state-rg"
    storage_account_name = "tfdevbackendsooraj"
    container_name       = "tfstate"
    key                  = "ghe-copilot-miniproject.tfstate"
  }
}

provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "git::https://github.com/soorajskr-web/tf-shared-modules//tf-module-resource-group?ref=v1.0.0"

  resource_group_name = var.resource_group_name
  location            = var.location
  environment         = var.environment
  project_name        = "ghe-copilot-miniproject"
}

module "aks" {
  source = "git::https://github.com/soorajskr-web/tf-shared-modules//tf-module-aks?ref=v1.0.0"

  cluster_name        = var.cluster_name
  location            = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  system_node_count   = var.system_node_count
  environment         = var.environment
  project_name        = "ghe-copilot-miniproject"
}

module "aks_nodepool" {
  source = "git::https://github.com/soorajskr-web/tf-shared-modules//tf-module-aks-nodepool?ref=v1.0.0"

  nodepool_name         = "userpool"
  kubernetes_cluster_id = module.aks.aks_cluster_id
  node_count            = var.user_node_count
  environment           = var.environment
  project_name          = "ghe-copilot-miniproject"
}