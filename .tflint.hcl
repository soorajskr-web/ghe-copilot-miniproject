plugin "azurerm" {
  enabled = true
  version = "0.26.0"
  source  = "github.com/terraform-linters/tflint-ruleset-azurerm"
}

config {
  call_module_type = "none"
}

rule "azurerm_resource_group_invalid_location" {
  enabled = true
}

rule "azurerm_kubernetes_cluster_invalid_vm_size" {
  enabled = true
}